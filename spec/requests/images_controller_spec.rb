require "rails_helper"

RSpec.describe "ImageUploadAPI", type: :request do
  include Rack::Test::Methods
  include ActionDispatch::TestProcess

  let(:images) do
    [
      File.open("spec/fixtures/files/test_fire.jpg"),
      File.open("spec/fixtures/files/test_mini.jpg"),
    ]
  end

  let(:req) { post "/api/images/upload", params: { images: images } }
  let(:init_count) { ImageLog.count }

# TODO: add spec

  context "画像アップロードAPIにリクエストしたとき" do
    xit "データが作成されている" do
      is_asserted_by { ImageLog.count == init_count }
      req.set_form(images, "multipart/form-data")
      is_asserted_by { ImageLog.count == init_count + 1 }
    end

    xit "ステータス200が返る" do
      is_asserted_by { response.status == 200 }
    end
  end
end
