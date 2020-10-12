module Api
  class ReportsController < ApplicationController
    def create
      @report = Report.create!(message_params)
      render json: {
        report: {
          memo: @report.memo,
          pic:  @report.pic,
        },
        status: 200,
      }
    end

    private

    def message_params
      params.require(:report).permit(:memo, :pic, :images)
    end
  end
end
