require 'spec_helper'
require 'robin-rails'
require 'active_record'

require_relative '../fixtures/dummy_model'
require_relative '../fixtures/ams_model'

describe Robin::Rails do
  before(:all) do
    # Throw together a fake DB
    ActiveRecord::Base.establish_connection(
      :adapter  => 'sqlite3',
      :database => ':memory:'
    )

    ActiveRecord::Migration.verbose = false
    ActiveRecord::Schema.define do
      create_table :dummy_models, force: true do |t|
        t.string  "name"
        t.integer "age"
      end

      create_table :ams_models, force: true do |t|
        t.string  "name"
        t.integer "age"
      end
    end
  end

  context 'included module' do
    it 'calls publish after create' do
      Robin.should_receive(:publish).with(anything, :created, anything)

      DummyModel.create
    end

    it 'calls publish after update' do
      record = DummyModel.create
      Robin.should_receive(:publish).with(anything, :updated, anything)
      record.save
    end

    it 'calls publish after destroy' do
      record = DummyModel.create
      Robin.should_receive(:publish).with(anything, :destroyed, anything)
      record.destroy
    end
  end

  context 'alternate serializers' do
    let(:default_json) { {"name"=>"ams", "age"=>5} }
    let(:ams_json) { {:ams_model=>{:name=>"ams", :age=>5, :boom=>"BOOM!"}} }

    it 'uses default serializer' do
      Robin.should_receive(:publish)
        .with(anything, :created, hash_including("id", default_json))

      DummyModel.create :name => "ams", :age => 5
    end

    it 'uses AMS when available' do
      Robin.should_receive(:publish)
        .with(anything, :created, ams_json)

      AmsModel.create :name => "ams", :age => 5
    end
  end
end
