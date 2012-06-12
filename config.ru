require 'sinatra'
require 'logger'

set :env, :production

logfile = 'log/visit.log'
unless File.exist?(logfile)
  File.open(logfile, 'w') do |f|
    f.puts Time.now
  end
end

$logger = Logger.new 'log/visit.log'

if defined?(run) 
  disable :run
  require './fdlint-host'
  run Sinatra::Application
else
  require './fdlint-host'
end
