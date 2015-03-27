require 'config_scripts/config_script'
require 'seeds/loader'
require 'csv'

# rails r db/seeds/02_general/us.rb up
class UsSeed < ConfigScript
  def columns
    [:code2, :zip, :city, :state, :state_code, :county, :what, :lat, :lon]
  end
  
  def us_data
    File.read(File.join(Rails.root, 'db', 'config_scripts/us.csv'))
  end

  def parsed
    CSV.parse(self.us_data).map do |line|
      Hash[self.columns.each_with_index.map{|column,index| [column,line[index].to_s.strip]}]
    end
  end

  def state_from_line(line)
    State.where(
      :name => line[:state],
      :code => line[:state_code],
      :country_id => Country.find_by_code2( line[:code2]).id 
    ).first_or_create
  end
  
  def zip_from_line(line)
    Zip.where(
      :code => line[:zip],
      :latitude => line[:lat],
      :longitude => line[:lon],
      :state_id => self.state_from_line(line).id 
    ).first_or_create
  end
  
	def city_from_line(line)
	  City.where(
	    :name => line[:city],
	    :county => line[:county],
	    :state_id => self.state_from_line(line).id 
	  ).first_or_create
	end
	
  def bring_up
     puts "Processing ....."
     self.parsed.each do |line|
       self.city_from_line(line)
       self.zip_from_line(line)
     end
     State.where( name: '').destroy_all
     puts "Completed!!!"
   end

  def bring_down
    puts "Processing undo ....."
    self.parsed.each do |line|
      self.zip_from_line(line).destroy rescue nil
      self.city_from_line(line).destroy rescue nil
      self.state_from_line(line).destroy rescue nil
    end
    puts "Undo Successful!!!"
  end

end

UsSeed.new

