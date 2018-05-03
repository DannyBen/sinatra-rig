# Require all gems from the Gemfile
require 'rubygems'
require 'bundler'
Bundler.require :default, :development

# ...and then some
# require 'sinatra'
require "sinatra/reloader"
require 'sass/plugin/rack'

# Require my stuff
dir = "#{File.dirname(__FILE__)}/.."
require_all "#{dir}/lib/**/*.rb"
# require_all "#{dir}/models/**/*.rb"

# Reloader config
also_reload "#{dir}/lib/**/*.rb"

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