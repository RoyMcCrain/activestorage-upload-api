require "rails_helper"

RSpec.describe "ImageUploadAPI", type: :request do
  let(:params) do
    {
      images: Rack::Test::UploadedFile.new(
        Rails.root.join("spec/fixtures/test_mini.jpg").to_s,
        "image/jpg",
      ),
    }
  end

  let(:req) { post "/api/images/upload", params: { images: params }, as: :json }

  let(:init_count) { ImageLog.count }

  context "正しい形式のファイルをアップロードしたとき" do
    it "ステータス200が返る" do
      req
      is_asserted_by { response.status == 200 }
    end
    it "データが作成されている" do
      is_asserted_by { ImageLog.count == init_count }
      req
      is_asserted_by { ImageLog.count == init_count + 1 }
    end
  end

  context "対応していない拡張子のファイルをアップロードしたとき" do
    let(:params) do
      {
        images: Rack::Test::UploadedFile.new(
          Rails.root.join("spec/fixtures/sample.xlsx").to_s,
          "application/json",
        ),
      }
    end
    it "エラーメッセージが返る" do
      req
    end
  end
end
