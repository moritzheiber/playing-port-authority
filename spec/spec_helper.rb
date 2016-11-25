require 'serverspec'
require 'docker-api'
require 'rspec/wait'

set :backend, :docker
set :os, family: :alpine
