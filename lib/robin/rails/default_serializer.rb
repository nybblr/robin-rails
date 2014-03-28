module Robin
  module Rails
    class DefaultSerializer
      attr_reader :resource
      attr_reader :options

      def initialize(resource, options={})
        @resource = resource
        @options = options
      end

      def as_json
        resource.as_json(options)
      end

      def to_json
        resource.to_json(options)
      end
    end
  end
end
