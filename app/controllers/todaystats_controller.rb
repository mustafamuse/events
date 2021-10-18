# frozen_string_literal: true

class TodaystatsController < ApplicationController
  def index
    # looks up all the events within todays date and groups them by event type and returns the count for each event
    whole_day_event_count = Event.where(created_at: Date.today.all_day).group(:event_type).count
    aggregated_data = whole_day_event_count.collect { |k, v| { k => v } }
    render json: { todays_stats: aggregated_data }
  end
end
