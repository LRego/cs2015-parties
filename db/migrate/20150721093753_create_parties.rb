class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |party|
      party.string :name
      party.string :address
      party.string :longitude
      party.string :latitude
      party.datetime :time
    end 
  end
end
