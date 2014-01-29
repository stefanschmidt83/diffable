module Diffable
  class Attribute
    attr_reader :field, :object1, :object2

    def initialize(field, object1, object2)
      @field, @object1, @object2 = field, object1, object2
    end

    def comparable?
      value1 and value2 and value1 != value2
    end

    private

      def value1
        value_for(object1)
      end

      def value2
        value_for(object2)
      end

      def value_for(object)
        value = object.diff_value_for(field)
        value if value and value.is_a?(String)
      end
  end
end