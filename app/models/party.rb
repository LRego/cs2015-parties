class Party < ActiveRecord::Base

  has_many :attendees

  def partytxt

    File.open("exported_files/#{name}.txt", 'w') do |file|
        attendees.each do |attendee|
            file.write("#{attendee.name}\n")
        end
    end
  end

end
