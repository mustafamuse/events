# frozen_string_literal: true
class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_type, :extra_params

  def extra_params
    JSON.parse(object.additional_data)
  end
end
