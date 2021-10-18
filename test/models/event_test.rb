# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @first_event = Event.new(name: 'share_button', event_type: 'share')
    @second_event = Event.new(name: 'click_button', event_type: 'click', additional_data: { button_color: 'green' })
  end

  test 'valid @first_event: name and event_type only' do
    assert @first_event.valid?
    assert_equal 'share', @first_event.event_type
    assert_equal 'share_button', @first_event.name
    assert_nil @first_event.additional_data
  end

  test 'invalid events(both): invalid without name' do
    @first_event.name = nil
    @second_event.name = nil
    refute @first_event.valid?, 'saved first_event without a name'
    refute @second_event.valid?, 'saved second_event without a name'
    assert_not_nil @first_event.errors[:name], 'no validation error for name present'
    assert_not_nil @second_event.errors[:name], 'no validation error for name present'
  end

  test 'invalid events(both): invalid without event_type' do
    @first_event.event_type = nil
    @second_event.event_type = nil
    refute @first_event.valid?, 'saved first_event without a event_type'
    refute @second_event.valid?, 'saved second_event without a event_type'
    assert_not_nil @first_event.errors[:event_type], 'no validation error for event_type present'
    assert_not_nil @second_event.errors[:event_type], 'no validation error for event_type present'
  end

  test 'valid @second_event: name, event and additonal data' do
    assert @second_event.valid?
    assert_equal 'click', @second_event.event_type
    assert_equal 'click_button', @second_event.name
    assert_not_nil @second_event.additional_data
    refute_empty @second_event.additional_data
  end
end
