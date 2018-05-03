require 'sinatra'
require_relative 'lib/boot'

get '/' do
  slim :index, locals: { message: 'Fairly Local' }
end


