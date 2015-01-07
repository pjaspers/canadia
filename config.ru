require "bundler/setup"
require "shack"
use Rack::Static, :urls => ["/public"]
Shack::Middleware.configure do |shack|
  shack.sha = "e8e4c4bf"
end
use Shack::Middleware
require "./kkez"
run Sinatra::Application
