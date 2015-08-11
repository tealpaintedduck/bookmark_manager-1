require 'data_mapper'
require 'sinatra/base'
require './app/models/link.rb'
require './data_mapper_setup'

class BookMarkManager < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect to('/links') #redirect '/links'
  end

  run! if app_file == $0
end
