class EventsController < ApplicationController

  def index

    @events = Event.order('created_at DESC')

  end

  def show

  end

end
