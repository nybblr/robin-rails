require 'spec_helper'
require 'robin-rails'

describe Robin do
  let(:data)   { {id: 1, title: "hello"} }
  let(:record) {
    double(:record, class: double(model_name: double(route_key: 'records')))
  }

  context '#configure' do
    it 'has reasonable defaults' do
      Robin.faye_url.should == 'http://localhost:9292/faye'
    end

    it 'can override defaults' do
      Robin.configure do |config|
        config.faye_url = 'http://faye.local/faye'
      end

      Robin.faye_url.should == 'http://faye.local/faye'
    end
  end

  context '#publish' do
    it 'makes a properly formatted request' do
      Net::HTTP.should_receive(:post_form).with(
        anything, {message: {channel: "/records/created", data: data}.to_json}
      )
      Net::HTTP.stub(:post_form)

      Robin.publish record, :created, data
    end

    it 'sends the request to the configured server' do

        # URI.parse('http://localhost:9292/faye'),
    end
  end

  context '#channel_for' do
    it 'generates a path similar to a Rails route' do
      Robin.channel_for(record, :busted).should == "/records/busted"
    end
  end
end
