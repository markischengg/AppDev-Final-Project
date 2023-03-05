# == Schema Information
#
# Table name: courts
#
#  id         :integer          not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Court < ApplicationRecord
  belongs_to :user
  has_many :bookings
end
