class Attendee < ActiveRecord::Migration
  def change
    create_table :attendees do |attendee|
      attendee.string :name
      attendee.string :email
      attendee.integer :party_id
    end 
  end
end
