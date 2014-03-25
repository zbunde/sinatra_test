require 'sinatra/base'

class App < Sinatra::Base

  set :method_override, true

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
    erb :show, :locals => {:item => item, :id => id}
  end

  get "/items/:id/edit" do
    id = params[:id].to_i
    item = MENU[id]
    erb :edit, :locals => {:item => item, :id => id}
  end

  post "/items/:id" do
    name = params[:name]
    MENU[params[:id].to_i] = name

    erb :items, :locals => {:menu => MENU}

  end

  delete "/items/:id" do
    id = params[:id].to_i
    MENU.delete(id)

    redirect '/items'

  end

end
