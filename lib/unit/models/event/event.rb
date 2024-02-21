# frozen_string_literal: true

module Unit
  module Event
    EVENT_LIST_LIMIT = 100
    EVENT_LIST_OFFSET = 0

    autoload :ListEventParams, "unit/models/event/list_event_params"
    class << self
      # Get event by id
      # @see https://docs.unit.co/events#get-event
      # @param event_id [String]
      def get_event(event_id:)
        Unit::Resource::EventResource.get(event_id)
      end

      # List events
      # @see https://docs.unit.co/events#list-events
      # @param limit [Integer]
      # @param offset [Integer]
      # @param type [Array<String>] - optional
      # @param since [String] - optional
      # @param _until [String] - optional
      def list_events(limit: EVENT_LIST_LIMIT, offset: EVENT_LIST_OFFSET, type: nil, since: nil, _until: nil)
        params = ListEventParams.new(limit, offset, type, since, _until)
        Unit::Resource::EventResource.list(params)
      end

      # Fire event
      # @see https://docs.unit.co/events#fire-event
      # @param event_id [String]
      def fire_event(event_id:)
        Unit::Resource::EventResource.fire(event_id)
      end
    end
  end
end
