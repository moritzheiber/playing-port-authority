require 'spec_helper'
require 'open-uri'

image2 = Docker::Image.build_from_dir('.', dockerfile: 'Dockerfile.example2')

describe 'Example2' do
  set :docker_image, image2.id

  describe 'API' do
    it 'should be listening on port 4567' do
      wait_for(port(4567)).to be_listening
    end

    it 'should respond with "Sample Web Service"' do
      expect(
        website_content('http://localhost:4567')
      ).to match(/Sample Web Service/)
    end
  end
end

def website_content(url)
  command("curl #{url}").stdout
end
