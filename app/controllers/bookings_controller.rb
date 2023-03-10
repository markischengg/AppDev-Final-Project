class BookingsController < ApplicationController
  def index
    if @current_user.type != 'admin'
      matching_bookings = Booking.where({ :user_id => @current_user.id })
    else
      matching_bookings = Booking.all
    end

    @booking_date = params.fetch("date")
    @booking_date = Date.parse(@booking_date)
  
    @list_of_bookings = Booking.where({ :date => @booking_date }).order({ :book_time => :asc})

    @user_bookings = matching_bookings.order({ :time => :asc })


    render({ :template => "bookings/index.html.erb" })
  end

  def create
    the_booking = Booking.new
    the_booking.time = params.fetch("query_time")
    the_booking.duration = params.fetch("query_duration")
    the_booking.user_id = session.fetch(:user_id)
    the_booking.court_id = params.fetch("query_court_number")
    the_booking.date = the_booking.time.strftime("%Y-%m-%d")
    the_booking.book_time = the_booking.time.strftime("%R %p")

    @current_user.tab = @current_user.tab + 30

    #Get datetime array of all Bookings
    list_of_bookings = Booking.all
    time_array = Array.new

    list_of_bookings.each do |a_booking|
      time_array.push(a_booking.time)
    end 

    if time_array.include?(the_booking.time) 
      redirect_to("/bookingschedule/#{the_booking.time}", { :alert => "Booking not available" })
    elsif the_booking.valid?
      the_booking.save
      redirect_to("/bookingschedule/#{the_booking.time}", { :notice => "Booking created successfully." })
    else
      redirect_to("/bookings", { :alert => the_booking.errors.full_messages.to_sentence })
    end

  end

  def show
    the_id = params.fetch("path_id")

    matching_bookings = Booking.where({ :id => the_id })

    @the_booking = matching_bookings.at(0)

    @list_of_users = User.all

    render({ :template => "bookings/show.html.erb" })
  end

  def update
    the_id = params.fetch("path_id")
    the_booking = Booking.where({ :id => the_id }).at(0)

    the_booking.time = params.fetch("query_time")
    the_booking.duration = params.fetch("query_duration")
    the_booking.date = the_booking.time.strftime("%Y-%m-%d")
    the_booking.book_time = the_booking.time.strftime("%R %p")

    if the_booking.valid?
      the_booking.save
      redirect_to("/bookingschedule/#{the_booking.id}", { :notice => "Booking updated successfully."} )
    else
      redirect_to("/bookingschedule/#{the_booking.id}", { :alert => the_booking.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_booking = Booking.where({ :id => the_id }).at(0)

    the_booking.destroy

    redirect_to("/bookingschedule/#{Date.today}", { :notice => "Booking deleted successfully."} )
  end
end
