module Api
  class ImagesController < ApplicationController
    def upload
      ext_validate
      mime_validate
      image_log = ImageLog.create!(uploaded_at: Time.zone.now)
      rename_image
      image_log.images.attach(params[:images])

      render json: {
        url: image_log.image_url,
      }
    rescue => e
      render json: {
        error: e.message,
      }
    end

    private

    def rename_image
      params[:images].each do |image|
        image.original_filename = "#{SecureRandom.uuid}.jpg"
      end
    end

    def validate_gcs
      # TODO: Create validation for gcs connection
    end

    # 拡張子よりもRubyのFile.extnameメソッドでチェックする
    def ext_validate
      file_names = params[:images].map(&:original_filename)
      ext_allowlist = [".png", ".jpg", ".jpeg", ".gif"]

      file_names.each do |v|
        if ext_allowlist.exclude?(File.extname(v))
          raise "Invalid extension."
        end
      end
    end

    # "image/"でバリデーションするのはあまり意味がない（改竄可能）なので
    # マジックバイトを検証する
    def mime_validate
      # 47494638=GIF, ffd8ffe0=JPEG, 89504e47=PNG
      magic_list = ["47494638", "ffd8ffe0", "89504e47"]
      params[:images].each do |i|
        file = File.new(i, "r")
        data = file.read(4)
        file.close
        # 　　　　　　　　　   　　　data.unpack("H8")[0]と同じ
        if magic_list.exclude?(data.unpack1("H8"))
          raise "Invalid format."
        end
      end
    end
  end
end
