class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @r = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    # binding.pry
    @r = Recipe.find(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do
    @r = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @r = Recipe.find(params[:id])
    @r.name = params[:name]
    @r.ingredients = params[:ingredients]
    @r.cook_time = params[:cook_time]
    @r.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @r = Recipe.find(params[:id])
    @r.delete
    redirect to '/recipes'
  end
end
