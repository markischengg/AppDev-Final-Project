# == Schema Information
#
# Table name: offerings
#
#  id         :integer          not null, primary key
#  cost       :float
#  paid       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Offering < ApplicationRecord
  belongs_to :user
end
