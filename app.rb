require 'sinatra/base'

class App < Sinatra::Base

  ARRAY = []

  get "/" do
    erb :index, :locals => {:items => ARRAY}
  end

  get "/new" do
    erb :new
  end

  post "/new" do
    ARRAY << params[:new_food]
    redirect '/'
  end


end