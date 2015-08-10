require 'data_mapper'
require 'sinatra/base'
require './app/models/link.rb'

class BookMarkManager < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  run! if app_file == $0
end