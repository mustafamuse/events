# frozen_string_literal: true

class EventsController < ApplicationController
  def create
    event = Event.new(event_params)
    if event.save
      render json: event, status: 201
    else
      render json: { errors: event.errors.full_messages }, status: 422
    end
  end

  private

  def event_params
    # this private method is 'include' the extra parms (user event types) as a key of 'additonal_data'
    extra_params = params[:event].permit!.to_h.select { |key| key != 'name' || 'event_type' }.to_s.gsub('=>', ':')
    params.require(:event).permit(:name, :event_type).merge({ additional_data: extra_params })
  end
end
