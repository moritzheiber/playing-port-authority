require 'spec_helper'
require 'docker/compose'

describe 'Example3' do
  compose = Docker::Compose.new
  set :docker_container, 'sinatra'

  before(:all) do
    compose.up(detached: true)

    id = compose.ps.find { |c| c.image == 'consul' }.id
    c = Docker::Container.get(id)
    sleep 3 # wait for consul to start
    c.exec(['consul', 'kv', 'put', 'sinatra/message',
            'hello from consul'])
  end

  after(:all) do
    compose.kill
    compose.rm(force: true)
  end

  describe 'Consul Connection' do
    it 'responds with consul kv "hello from consul"' do
      wait_for(
        website_content('http://localhost:4567/message')
      ).to match(/hello from consul/)
    end
  end
end

def website_content(url)
  command("curl #{url}").stdout
end
