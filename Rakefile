task :webserver do
  require 'webrick'
  include WEBrick

  s = HTTPServer.new(
    Port: 9001,
    DocumentRoot: '.'
  )

  trap('INT') { s.shutdown }
  s.start
end

