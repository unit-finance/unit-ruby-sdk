# frozen_string_literal: true

module Unit
  module Types
    class Industry < T::Struct
      prop :start_time, String
      prop :end_time, String
      prop :interval, String
      prop :day_of_month, Integer
      prop :total_number_of_payments, Integer
      prop :next_scheduled_action, String
    end
  end
end
