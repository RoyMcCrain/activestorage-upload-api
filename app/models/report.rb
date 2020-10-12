# == Schema Information
#
# Table name: reports
#
#  id         :bigint           not null, primary key
#  memo       :string
#  pic        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Report < ApplicationRecord
  has_many_attached :images
end
