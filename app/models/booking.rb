# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  duration   :float
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Booking < ApplicationRecord
  belongs_to :user, :required => true
  belongs_to :court
end
