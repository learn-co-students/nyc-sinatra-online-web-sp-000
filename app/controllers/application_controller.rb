class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  register Sinatra::Twitter::Bootstrap::Assets
  #register Sinatra::ActiveRecordExtension

  get '/' do
    erb :"application/index"
  end
end
