class BookingsController < ApplicationController
  def index
    matching_bookings = Booking.all

    @list_of_bookings = matching_bookings.order({ :created_at => :desc })

    render({ :template => "bookings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bookings = Booking.where({ :id => the_id })

    @the_booking = matching_bookings.at(0)

    render({ :template => "bookings/show.html.erb" })
  end

  def create
    the_booking = Booking.new
    the_booking.time = params.fetch("query_time")
    the_booking.duration = params.fetch("query_duration")
    the_booking.user_id = session.fetch(:user_id)
    the_booking.court_id = params.fetch("query_court_number")

    if the_booking.valid?
      the_booking.save
      redirect_to("/bookings", { :notice => "Booking created successfully." })
    else
      redirect_to("/bookings", { :alert => the_booking.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_booking = Booking.where({ :id => the_id }).at(0)

    the_booking.time = params.fetch("query_time")
    the_booking.duration = params.fetch("query_duration")

    if the_booking.valid?
      the_booking.save
      redirect_to("/bookings/#{the_booking.id}", { :notice => "Booking updated successfully."} )
    else
      redirect_to("/bookings/#{the_booking.id}", { :alert => the_booking.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_booking = Booking.where({ :id => the_id }).at(0)

    the_booking.destroy

    redirect_to("/bookings", { :notice => "Booking deleted successfully."} )
  end
end
