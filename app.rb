require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "pry-byebug"
require "better_errors"
require "active_record"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

require_relative 'models/restaurant'

get '/' do
  # 1. Demander au repo la liste des restos
  @restos = Restaurant.all
  # 2. Donner les restos à la vue pour affichage
  erb :index
end

get '/restaurants/:id' do
  id = params[:id]
  @resto = Restaurant.find(id)
  erb :show
end
