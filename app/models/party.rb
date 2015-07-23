class Party < ActiveRecord::Base

  has_many :attendees

  def export

    File.open("exported_files/#{name}.txt", 'w') do |file|
        attendees.each do |attendee|
            file.write("#{attendee.name}\n")
        end
    end
  end

  def import(csv)


    CSV.foreach(csv, :headers => true) do |row|
        Attendee.create({
            name: row['name'], 
            email: row['email'],
            party_id: id
            })

    end
  end

end
