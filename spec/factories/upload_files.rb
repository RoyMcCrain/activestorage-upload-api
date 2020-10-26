FactoryBot.define do
  factory :upload_file do
    content do
      ActionDispatch::Http::UploadedFile.new(
        filename: "test_fire.jpg",
        type:     "image/jpg",
        tempfile: File.open("spec/fixtures/files/test_fire.jpg"),
      )
    end
  end
end
