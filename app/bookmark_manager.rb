require 'data_mapper'
require 'sinatra/base'
require './app/models/link.rb'
require './data_mapper_setup'

class BookMarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  # post '/link' do
  # @post_link = Link.new(
  #   :title => "Makers Academy",
  #   :url => "http://makersacademy.com"
  # )

  set :views, proc { File.join(root, '..', 'views') }

  run! if app_file == $0
end
