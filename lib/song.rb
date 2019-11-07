require 'pry'
class Song
  attr_accessor :name, :artist_name 
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create 
    song = self.new 
    song.name = name
    @@all << song
    song
  end 
  
  def self.new_by_name(name)
    song = self.new       #creates new object/ instance
    song.name = name      #gives object a name
    song                  # returns that object
  end 
  
  def self.create_by_name(name)
    song = self.new         #creates instance/object
    song.name = name        #sets name to that object
    @@all << song           #saves to array
    song 
  end 
  
  def self.find_by_name(name)
      @@all.detect { |song| song.name == name} #finds a song
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name) #prevents duplicating 
  end 

  def self.alphabetical   # return songs in ascending order a-z
    @@all.sort_by {|song| song.name}
  end 

  def self.new_from_filename(name)
    song = self.new 
    song.name = name.split(" - ")[1].chomp(".mp3")
    song.artist_name = (name.split(" - ")[0])
    song
  end 
  
  def self.create_from_filename(name)
    song = self.new
    song.name = name.split(" - ")[1].chomp(".mp3")
    song.artist_name = (name.split(" - ")[0])
    @@all << song 
    song 
  end 
    
    def self.destroy_all
     self.all.clear
    end 
#binding.pry 

end
