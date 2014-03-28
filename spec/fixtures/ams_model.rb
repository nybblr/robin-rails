require 'active_model_serializers'

class AmsModel < ActiveRecord::Base
  include Robin::Rails
end

class AmsModelSerializer < ActiveModel::Serializer
  attributes :name, :age, :boom

  def boom
    "BOOM!"
  end
end
