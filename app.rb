require 'sinatra/base'

class App < Sinatra::Base

  get "/" do
  erb :index
    end

  get "/new" do
    erb :new
  end

  post "/new" do
    redirect "/"
  end
end