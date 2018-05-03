require 'sinatra'
require_relative 'lib/boot'

get '/' do
  json hello: 'world'
end
