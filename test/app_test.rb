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
    assert_includes last_response.body, "It's so cold,"
  end

  def test_it_handles_slugs_it_doesn_t_know
    get "/nilo"
    assert_includes last_response.body, "You hoser!"
  end

  def test_no_double_slugs
    all = YAML.load_file(File.expand_path("../../mounties.yml", __FILE__))
    assert_equal all.count, all.collect{|a| a["slug"]}.uniq.count
  end

  YAML.load_file(File.expand_path("../../mounties.yml", __FILE__)).each do |data|
    slug = data["slug"]
    define_method("test_it_resolves_#{slug}") do
      get "/#{slug}"
      assert_includes last_response.body, data["content"]
    end
  end
end
