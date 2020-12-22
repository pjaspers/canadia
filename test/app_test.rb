# test_helper.rb
ENV["RACK_ENV"] = "test"
require "minitest/autorun"
require "minitest/pride"
require "rack/test"

require File.expand_path "../../canadia.rb", __FILE__

class MyAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    OhCanada
  end

  def test_it_declares_its_cold_in_canada
    get "/"
    follow_redirect!
    assert_includes last_response.body, "It's so cold,"
  end

  def test_it_handles_slugs_it_doesn_t_know
    get "/nilo"
    assert_includes last_response.body, "You hoser!"
  end
end
