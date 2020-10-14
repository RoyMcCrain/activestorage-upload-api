module Api
  class ReportsController < ApplicationController
    def create
      report = Report.create!(report_params)
      render json: {
        memo: report.memo,
        order: report.order,
      }
    end

    def update
      report = Report.find_by(id: params[:id])
      report.attach(images)
    end

    private

    def report_params
      params.permit(:memo, :order, images: [])
    end
  end
end
