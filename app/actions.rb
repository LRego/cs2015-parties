require 'csv'

get '/' do
    redirect '/parties'
end

# list of all parties
get '/parties' do
    if params.key?('name') && params[:name].length >= 3
        @parties = Party.select do |party|
            party.name.downcase.include?(params[:name].downcase)
        end
    else
        @parties = Party.all
    end

    if params.key?('sort')
        @parties = Party.all.order(time: params[:sort])
    end
	
	erb :index
end

# form to create a new party
get '/parties/new' do
  erb :new
end

# show individual post
get '/parties/:id' do
	@party = Party.find(params[:id])
    @attendees = @party.attendees 
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
    attendee = Attendee.find(params[:id])
    party_id = attendee.party_id
    attendee.destroy
    redirect "/parties/#{party_id}"
end


post '/parties/create/:party_id/attendee' do
    Attendee.create({
        name: params[:name], 
        email: params[:email],
        party_id: params[:party_id]
        })
    redirect "/parties/#{params[:party_id]}"
end


post '/parties/:party_id/attendee/export' do

    party = Party.find(params[:party_id])

    party.partytxt

    redirect "/parties/#{params[:party_id]}"

end


post '/parties/:party_id/attendee/import_csv' do
    @party = Party.find(params[:party_id])
    CSV.foreach(params[:csv][:tempfile], :headers => true) do |row|
        p row
        Attendee.create({
            name: row['name'], 
            email: row['email'],
            party_id: params[:party_id]
            })

    end
    redirect "/parties/#{params[:party_id]}"
end
