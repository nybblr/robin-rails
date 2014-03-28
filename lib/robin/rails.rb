require 'active_support/concern'
require 'robin/rails/default_serializer'

module Robin
  module Rails
    extend ActiveSupport::Concern

    included do
      after_create do |record|
        ::Robin.publish record, :created, robin_serializer(record).as_json
      end

      after_update do |record|
        ::Robin.publish record, :updated, robin_serializer(record).as_json
      end

      after_destroy do |record|
        ::Robin.publish record, :destroyed, id: record.id
      end
    end

    private

    def robin_serializer(resource)
      serializer =
        (resource.respond_to?(:active_model_serializer) &&
         resource.active_model_serializer) ||
        ::Robin::Rails::DefaultSerializer

      serializer.new(resource)
    end

    module ClassMethods
    end
  end
end
