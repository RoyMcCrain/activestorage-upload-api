module Api
  class ImagesController < ApplicationController
    def upload
      validate_gcs
      report = Report.find_by(id: params[:order])
      rename_image(params[:images])
      if report.present?
        report.images.attach(params[:images])
        render json: {
          memo:   report.memo,
          order:  report.order,
          images: [report.images],
        }
      else
        render json: {
          error: "Report not found",
        }
      end
    end

    private

    def report_params
      params.permit(:memo, :order, images: [])
    end

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
