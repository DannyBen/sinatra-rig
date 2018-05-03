# Require all gems from the Gemfile
require 'rubygems'
require 'bundler'

root_dir = File.expand_path('../', __dir__)

# Require dependencies
if ENV['RACK_ENV'] == 'production'
  Bundler.require :default, :production
else
  Bundler.require :default, :development
  require "sinatra/reloader"
  also_reload "#{root_dir}/lib/**/*.rb"
end

# Configure Sinatra
set :bind, '0.0.0.0'
set :port, 3000
set :root, root_dir

