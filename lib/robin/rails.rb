require 'active_support/concern'
require 'net/http'

module Robin
  module Rails
    extend ActiveSupport::Concern

    included do
      after_create do |record|
        ::Robin.publish record, :created, record.attributes
      end

      after_update do |record|
        ::Robin.publish record, :updated, record.attributes
      end

      after_destroy do |record|
        ::Robin.publish record, :destroyed, id: record.id
      end
    end

    module ClassMethods
    end
  end
end
