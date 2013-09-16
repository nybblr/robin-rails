require 'active_support/core_ext/module/attribute_accessors'

module Robin
  mattr_accessor :faye_url
  @@faye_url = 'http://localhost:9292/faye'

  class << self
    def configure
      yield self
    end

    def publish record, event, data
      msg = {
        channel: channel_for(record, event),
        data: data
      }

      uri = URI.parse("http://localhost:9292/faye")
      Net::HTTP.post_form(uri, message: msg.to_json)
    end

    def channel_for(record, event)
      "/#{record.class.model_name.route_key}/#{event}"
    end
  end
end
