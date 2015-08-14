module Armadillo
  module Routes
    class Home < Base
      get '/' do
        redirect '/links'
      end
    end
  end
end