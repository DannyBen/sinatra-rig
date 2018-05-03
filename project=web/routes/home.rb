get '/' do
  slim :index, locals: { message: 'Fairly Local' }
end


