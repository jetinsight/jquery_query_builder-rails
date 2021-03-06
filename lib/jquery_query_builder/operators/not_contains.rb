module JqueryQueryBuilder
  module Operators
    class NotContains
      def evaluate(left, right)
        !left.include?(right)
      end

      def sql_query(id, value)
        # sanitize_sql_for_conditions is made public in Rails 5.2
        ApplicationRecord.send(:sanitize_sql_for_conditions, ["(LOWER(#{id}) NOT LIKE LOWER(?))", "%#{value}%"] )
      end
    end
  end
end
