# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  book_time  :time
#  date       :string
#  duration   :float
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  court_id   :integer
#  user_id    :integer
#
class Booking < ApplicationRecord
  belongs_to :user,:required => true
  belongs_to :court,:required => true
end
