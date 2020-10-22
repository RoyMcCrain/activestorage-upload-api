module Api
  class ImagesController < ApplicationController
    def upload
      ext_validate(params[:images])
      image_log = ImageLog.create!(uploaded_at: Time.zone.now)
      rename_image(params[:images])
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

    def rename_image(images)
      images.each do |image|
        image.original_filename = "#{SecureRandom.uuid}.jpg"
      end
    end

    def validate_gcs
      # TODO: Create validation for gcs connection
    end

    def ext_validate(images)
      file_names = images.map(&:original_filename)
      ext_allowlist = [".png", ".jpg", ".jpeg", ".gif"]

      file_names.each do |v|
        if ext_allowlist.exclude?(File.extname(v))
          raise "Invalid extension."
        end
      end
    end
  end
end
