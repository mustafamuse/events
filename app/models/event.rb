# frozen_string_literal: true

class Event < ApplicationRecord
  possible_events = %w[submit refer click read login logout share signup subcribe]

  validates :name, presence: true
  validates :event_type, presence: true, inclusion: { in: possible_events }
end
