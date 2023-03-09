class CalendarController < ApplicationController
  def show
    @booking_date = params.fetch("date")
    @booking_date = Date.parse(@booking_date)

    @matching_bookings = Booking.all
    @list_of_bookings = Booking.where({ :date => @booking_date }).order({ :book_time => :asc})
    render({ :template => "calendar/show.html.erb" })
  end
end
