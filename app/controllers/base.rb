module Armadillo
  module Routes
    class Base < Sinatra::Base
      use Rack::MethodOverride
    set :views, proc { File.join(root, '..', '..', 'views') }
    enable :sessions
    set :session_secret, 'super secret'
    register Sinatra::Flash
    register Sinatra::Partial
    set :partial_template_engine, :erb

    helpers do
      def current_user
        User.get(session[:user_id])
      end
    end

    end
  end
end