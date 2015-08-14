require 'data_mapper'
require 'sinatra/base'
require './app/models/link.rb'
require './data_mapper_setup'
require 'sinatra/flash'
require 'sinatra/partial'
require './app/controllers/base'
require './app/controllers/links'
require './app/controllers/users'
require './app/controllers/tags'
require './app/controllers/sessions'
include BookMarkManager::Models

module Armadillo
  class BookMarkManager < Sinatra::Base

    use Routes::Links
    use Routes::Users
    use Routes::Tags
    use Routes::Sessions

    run! if app_file == $0
  end
end
