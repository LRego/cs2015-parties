get '/' do
    redirect '/parties'
end

# list of all parties
get '/parties' do
	@parties = Party.all
	erb :index
end

# form to create a new party
get '/parties/new' do
  erb :new
end

# show individual post
get '/parties/:id' do
	@party = Party.find(params[:id])
	erb :show
end

# form to edit a single party
get '/parties/:id/edit' do
    @party = Party.find do |party|
        party.id == params[:id].to_i
    end
    erb :edit
end

# method to save a new party, the /new route should point here
post '/parties/create' do
    party = Party.new name: params[:name], address: params[:address], longitude: params[:longitude], latitude: params[:latitude], time: params[:time]
    party.save
    redirect "/"
end

# method to update an existing party, the /:id/edit should point here

post '/parties/:id/update' do
    Party.update(params[:id], name: params[:name], address: params[:address], longitude: params[:longitude], latitude: params[:latitude], time: params[:time])
    redirect "/parties"
end

get '/parties/:id/remove' do
	Party.destroy(params[:id])
	redirect '/'
end

get '/attendee/:id/remove' do
    Attendee.destroy(params[:id])
    redirect '/'
end

get '/parties/:id/attendee' do
	erb :new_attendee
end
