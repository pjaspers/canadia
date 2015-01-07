require "bundler/setup"
require "shack"
use Rack::Static, :urls => ["/public"]
sha = ENV["SHA"] || "284246e6dc4a7a6b81064afc453d8e8dc0ef4d61"
Shack::Middleware.configure do |shack|
  shack.sha = sha
  shack.content = "<a href='https://github.com/pjaspers/canadia/commit/{{sha}}'>#{sha[0..8]}</a>"
end
use Shack::Middleware
require "./canadia"
run Sinatra::Application
