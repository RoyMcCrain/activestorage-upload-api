module Api
  class ImagesController < ApplicationController
    def upload
      puts "---------------- Uploading ----------------"
      image_log = ImageLog.create!(uploaded_at: Time.zone.now)
      rename_image(params[:images])
      image_log.images.attach(params[:images])
      render json: { url: image_log.image_url }
      puts "---------------- Uploaded!!!!! ----------------"
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
  end
end
