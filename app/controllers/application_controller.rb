class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  register Sinatra::Twitter::Bootstrap::Assets

#displays index.erb front page to user 
  get '/' do
    erb :"application/index"
  end
end
