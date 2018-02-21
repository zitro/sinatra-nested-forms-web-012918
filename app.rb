require './environment'
require 'capybara/rspec'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @new_pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |ship_info|
        Ship.new(ship_info)
      end
      @ships = Ship.all
      erb :'pirates/show'
    end

  end
end
