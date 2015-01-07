# test_helper.rb
ENV["RACK_ENV"] = "test"
require "minitest/autorun"
require "minitest/pride"
require "rack/test"

require File.expand_path "../../canadia.rb", __FILE__

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe "oh canadia" do
  it "declares its cold in Canada" do
    get "/"
    last_response.body.must_include "It's so cold,"
  end
end
