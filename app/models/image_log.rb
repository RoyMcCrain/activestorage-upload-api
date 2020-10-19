# == Schema Information
#
# Table name: image_logs
#
#  id           :bigint           not null, primary key
#  lock_version :integer          default(0), not null
#  uploaded_at  :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class ImageLog < ApplicationRecord
  has_many_attached :images

  # 画像のURLを取得する
  def image_url
    keys = self.images.blobs.pluck(:key)
    bucket_name = Rails.application.credentials[:bucket_name]
    keys.reduce([]) do |array, key|
      array << "https://storage.cloud.google.com/#{bucket_name}/#{key}"
    end
  end
end
