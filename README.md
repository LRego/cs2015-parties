Parties
A full featured web application to manager your parties. Use this project as a starting point.

Part I - CRUD

A party has a name, address, coordinates, date and time.

Create all the CRUD operations for the parties.

Features:

List all the available parties in a compact format.
View all the details of a single party.
Edit a party.
Create a new party.
Remove a party.
# list of all parties
get '/' do
  ...
end

# show individual post
get '/:id' do
  ...
end

# form to edit a single party
get '/:id/edit' do
  ...
end

# form to create a new party
get '/new do
  ...
end

# method to save a new party, the /new route should point here
post '/create' do
  ...
end

# method to update an existing party, the /:id/edit should point here
post '/:id/update' do
  ...
end
Part II - Attendees

Party are cool, but it's important to know who's going. You should be able to insert the name and email of the people that are attending. This will require an "Attendee" model with the name and email property. Each item of this model belongs to an existing party. Implement the following features:

Add an attendee to a party.
Remove an attendee to a party.
Make sure the emails are unique for each party.
Part III - Search and order

So many parties, this is getting out of hand. Your application needs to include a search mechanism based on the party name. It must also allow you to order parties by date in both directions. And both these features must work at the same time, meaning that if I search for something and the click to order I must only see searched partyes in ordered.
