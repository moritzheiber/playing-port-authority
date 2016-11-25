require 'sinatra'
require 'open-uri'
require 'json'
require 'base64'

set :bind, '0.0.0.0'

get '/message' do
  consul_value('sinatra/message')
end

def consul_value(key)
  data = open("http://consul:8500/v1/kv/#{key}").read
  Base64.decode64(JSON.parse(data)[0]['Value'])
end
