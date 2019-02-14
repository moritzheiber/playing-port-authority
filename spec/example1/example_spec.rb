require 'spec_helper'

image = Docker::Image.build_from_dir(
  '.',
  dockerfile: 'Dockerfile.example1',
  nocache: true
) do |v|
  if (log = JSON.parse(v)) && log.key?('stream')
    $stdout.puts log['stream']
  end
end

describe 'example1' do
  set :docker_image, image.id

  describe 'package ruby' do
    it 'is installed' do
      expect(package('ruby')).to be_installed
    end
  end
end
