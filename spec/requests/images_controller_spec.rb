require "rails_helper"

RSpec.describe "ImageUploadAPI", type: :request do
  let(:files) do
    [
      Rack::Test::UploadedFile.new(
        Rails.root.join("spec/fixtures/files/test_fire.jpg"),
        "image/jpg",
      ),
      Rack::Test::UploadedFile.new(
        Rails.root.join("spec/fixtures/files/test_mini.jpg"),
        "image/jpg",
      ),
    ]
  end

  let(:req) { post "/api/images/upload", params: { images: files } }
  let(:init_count) { ActiveStorage::Attachment.count }

  context "複数の画像ファイルをリクエストしたとき" do
    it "データが作成されている" do
      is_asserted_by { ActiveStorage::Attachment.count == init_count }
      req
      is_asserted_by { ActiveStorage::Attachment.count == init_count + 2 }
    end
    it "ステータス200が返る" do
      req
      is_asserted_by { response.status == 200 }
    end
  end

  context "不正なファイルをアップロードしたとき" do
    let(:files) do
      [
        Rack::Test::UploadedFile.new(
          Rails.root.join("spec/fixtures/files/sample.xlsx"),
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        ),
        Rack::Test::UploadedFile.new(
          Rails.root.join("spec/fixtures/files/test.txt"),
          "text/plain",
        ),
      ]
    end
    it "データは作成されていない" do
      is_asserted_by { ActiveStorage::Attachment.count == init_count }
      req
      is_asserted_by { ActiveStorage::Attachment.count == init_count }
    end
    it "エラーメッセージが返る" do
      req
      json = json_parser(response.body)
      is_asserted_by { json[:error] == "Invalid extension."}
    end
    it "ステータス200が返る" do
      req
      is_asserted_by { response.status == 200 }
    end
  end
end
