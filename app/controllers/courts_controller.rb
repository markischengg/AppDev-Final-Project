class CourtsController < ApplicationController
  def index
    matching_courts = Court.all

    @list_of_courts = matching_courts.order({ :created_at => :desc })

    render({ :template => "courts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_courts = Court.where({ :id => the_id })

    @the_court = matching_courts.at(0)

    render({ :template => "courts/show.html.erb" })
  end

  def create
    the_court = Court.new
    the_court.status = params.fetch("query_status")

    if the_court.valid?
      the_court.save
      redirect_to("/courts", { :notice => "Court created successfully." })
    else
      redirect_to("/courts", { :alert => the_court.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_court = Court.where({ :id => the_id }).at(0)

    the_court.status = params.fetch("query_status")

    if the_court.valid?
      the_court.save
      redirect_to("/courts/#{the_court.id}", { :notice => "Court updated successfully."} )
    else
      redirect_to("/courts/#{the_court.id}", { :alert => the_court.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_court = Court.where({ :id => the_id }).at(0)

    the_court.destroy

    redirect_to("/courts", { :notice => "Court deleted successfully."} )
  end
end
