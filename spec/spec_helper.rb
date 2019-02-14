require 'serverspec'
require 'docker-api'
require 'docker/compose'
require 'rspec/wait'

set :backend, :docker
set :os, family: :alpine
