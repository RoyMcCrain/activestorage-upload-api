require "rails_helper"

RSpec.describe "ImageUploadAPI", type: :request do
  let(:images) do
    [
      "spec/fixtures/files/test_fire.jpg",
      "spec/fixtures/files/test_mini.jpg",
    ]
  end

  let(:req) { post "/api/images/upload", params: { images: images }, as: :json }

  let(:init_count) { ImageLog.count }

  context "正しい形式のファイルをアップロードしたとき" do
    xit "ステータス200が返る" do
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
    it "エラーメッセージが返る" do
      req
    end
  end
end
