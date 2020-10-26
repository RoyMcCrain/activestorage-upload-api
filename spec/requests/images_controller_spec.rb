require "rails_helper"

RSpec.describe "ImageUploadAPI", type: :request do
  let(:images) do
    [
      ActionDispatch::Http::UploadedFile.new(
        original_filename:  "test_fire.jpg",
        type:               "image/jpg",
        tempfile:           "spec/fixtures/files/test_fire.jpg",
      ),
      ActionDispatch::Http::UploadedFile.new(
        original_filename:  "test_mini.jpg",
        type:               "image/jpg",
        tempfile:           "spec/fixtures/files/test_mini.jpg",
      ),
    ]
  end

  let(:req) { post "/api/images/upload", params: { images: images }, as: :json }
  let(:init_count) { ImageLog.count }

  context "画像アップロードAPIにリクエストしたとき" do
    xit "データが作成されている" do
      is_asserted_by { ImageLog.count == init_count }
      req
      # req.set_form(images, "multipart/form-data")
      is_asserted_by { ImageLog.count == init_count + 1 }
    end

    xit "ステータス200が返る" do
      is_asserted_by { response.status == 200 }
    end
  end

  context "不正なファイルをアップロードしたとき" do
    it "エラーメッセージが返る" do
    end
  end
end
