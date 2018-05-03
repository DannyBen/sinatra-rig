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

require 'sass/plugin/rack'

# Require my stuff
require_all "#{root_dir}/lib/**/*.rb"
# require_all "#{root_dir}/models/**/*.rb"

# Configure Sass
# Sass::Plugin.options[:style] = :compressed
Sass::Plugin.options[:template_location] = 'styles'
Sass::Plugin.options[:css_location] = 'public/css'
use Sass::Plugin::Rack

# Configure CoffeeScript
use Rack::Coffee, urls: '/scripts' #, root: 'public', urls: '/js'

# Configure Slim
Slim::Engine.set_options pretty: true

# Configure Sinatra
set :bind, '0.0.0.0'
set :port, 3000
set :root, root_dir

