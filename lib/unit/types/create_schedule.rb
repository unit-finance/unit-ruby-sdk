# frozen_string_literal: true

# Type for creating a schedule for recurring payments
# @see https://docs.unit.co/types#create-schedule
module Unit
  module Types
    class CreateSchedule
      attr_reader :interval, :day_of_month, :day_of_week, :start_time, :end_time, :total_number_of_payments

      # @param interval [String]
      # @param day_of_month [Integer]
      # @param day_of_week [String] - optional
      # @param start_time [String] - optional
      # @param end_time [String] - optional
      # @param total_number_of_payments [Integer] - optional
      def initialize(interval, day_of_month, day_of_week = nil, start_time = nil, end_time = nil, total_number_of_payments = nil)
        @interval = interval
        @day_of_month = day_of_month
        @day_of_week = day_of_week
        @start_time = start_time
        @end_time = end_time
        @total_number_of_payments = total_number_of_payments
      end

      def represent
        payload = {
          interval: interval,
          dayOfMonth: day_of_month,
          dayOfWeek: day_of_week,
          startTime: start_time,
          endTime: end_time,
          totalNumberOfPayments: total_number_of_payments
        }
        payload.compact!
      end
    end
  end
end
