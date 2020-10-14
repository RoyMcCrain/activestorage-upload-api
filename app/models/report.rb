# == Schema Information
#
# Table name: reports
#
#  id         :bigint           not null, primary key
#  memo       :string
#  order      :integer          default(1), not null
#  pic        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Report < ApplicationRecord
  has_many_attached :images

  # 画像のURLを取得する
  def image_url
    images.attached? ? url_for(images) : nil
  end
end
