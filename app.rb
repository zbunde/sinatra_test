require 'sinatra/base'

class App < Sinatra::Base

  MENU = {}

  get "/" do
    erb :index
  end

  post "/items" do
    name = params[:name]
    if MENU.empty?
      id = 1
    else
      id = MENU.keys[-1] + 1
    end

    MENU[id] = name

    erb :items, :locals => {:menu => MENU}

  end

  get "/items" do
    erb :items, :locals => {:menu => MENU}
  end

  get "/items/:id" do
    id = params[:id].to_i
    item = MENU[id]
    erb :show, :locals => {:item => item}
  end

end
