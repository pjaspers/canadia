require "bundler/setup"
require "shack"
use Rack::Static, :urls => ["/public"]
Shack::Middleware.configure do |shack|
  shack.sha = "39aee4f"
end
use Shack::Middleware
require "./kkez"
run Sinatra::Application
