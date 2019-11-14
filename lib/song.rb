require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end 
  
  def self.new_by_name(name)
  song = self.new 
  song.name = name
  song
  end 

  def self.create_by_name(name)
    song = self.new 
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find do 
      |song| song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end 
  end

  def self.alphabetical
    @@all.sort_by do
      |song| song.name
    end
  end
 
  def self.new_from_filename(filename)
    info = filename.split('.mp3')
    #next time just use .chomp it's much simpler
    song = self.new
    id = info[0].split(' - ')
    song.name = id[1]
    song.artist_name = id[0]
    #binding.pry
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song.name = filename.split(' - ')[1].chomp('.mp3')
    song.artist_name = filename.split(' - ')[0]
    @@all  << song
   #binding.pry
  end 

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
