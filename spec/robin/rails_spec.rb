require 'spec_helper'
require 'robin-rails'
require 'active_record'

require_relative '../fixtures/dummy_model'

describe Robin::Rails do
  before(:all) do
    # Throw together a fake DB
    ActiveRecord::Base.establish_connection(
      :adapter  => 'sqlite3',
      :database => ':memory:'
    )

    ActiveRecord::Migration.verbose = false
    ActiveRecord::Schema.define do
      create_table :dummy_models, force: true
    end
  end

  context 'included module' do
    before do
      Robin.stub(:publish)
    end

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
end
