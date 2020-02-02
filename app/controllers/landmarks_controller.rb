class LandmarksController < ApplicationController

  get "/landmarks" do
    "landmarks Index Route"
    erb :index
  end

  get "/landmarks/new" do
    "landmarks New Route"
    erb :new
  end

  get "/landmarks/:id" do
    "landmarks Show Route"
    erb :show
  end

  post "/landmarks" do
    "landmarks POST Route"
  end

  patch "/landmarks/:id/edit" do
    "landmarks Update Route"
  end
  
end
