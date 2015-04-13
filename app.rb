require 'sinatra'
require 'sinatra/reloader'
require 'slim'

set :slim, format: :html5

get '/' do
  slim :index
end
