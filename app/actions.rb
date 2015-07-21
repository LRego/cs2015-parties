# list of all parties
get '/' do
end

# show individual post
get '/:id' do
end

# form to edit a single party
get '/:id/edit' do
end

# form to create a new party
get '/new' do
end

# method to save a new party, the /new route should point here
 post '/create' do
  party = Party.new name: params[:name], address: params[:address], longitude: params[:longitude], latitude: params[:latitude], time: params[:time]
  party.save
  redirect "/"
 end

# method to update an existing party, the /:id/edit should point here
post '/:id/update' do
end