require "bundler/setup"
require "shack"
use Rack::Static, :urls => ["/public"]
Shack::Middleware.configure do |shack|
  shack.sha = "e8e4c4bf"
end
use Shack::Middleware
require "./canadia"
run Sinatra::Application
