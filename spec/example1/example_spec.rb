require 'spec_helper'

image = Docker::Image.build_from_dir(
  '.',
  'dockerfile' => 'Dockerfile.brown_bag_example_1'
)

describe 'Example1' do
  set :docker_image, image.id

  describe 'package ruby' do
    it 'should be installed' do
      expect(package('ruby')).to be_installed
    end
  end
end
