require 'data_mapper'
require 'sinatra/base'
require './app/models/link.rb'

class BookMarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all?
    erb :'links/index'
  end

  set :views, proc { File.join(root, '..', 'views') }

  run! if app_file == $0
end