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
    @song = self.new
    self.all << @song
    @song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else
      find_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end
  
  def self.new_from_filename(filename)
    data = filename.split(/( - )|\./)
    artist = data[0]
    name = data[2]
    
    song = Song.new
    song.artist_name = artist
    song.name = name
    
    song
    
  end
  
  def self.create_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[0])
    @@all << song
    song
  end
  
  def self.destroy_all
    @@all = []
  end
  
end
