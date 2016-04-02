run lambda { |env| [200, {'Content-Type'=>'text/plain'}, StringIO.new("Hello World!\n")] }
configure do
    . . .
    require 'redis'
    uri = URI.parse(ENV["REDISCLOUD_URL"])
    $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
    . . .
end
require './RollToDodge'
require './creds'
run Sinatra::Application
