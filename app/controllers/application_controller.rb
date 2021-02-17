class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  set :show_exceptions, false
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :"application/index"
  end
end
