require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name= name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name= name
    self.all << song
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    song = self.create
    details = file_name.split(" - ")
    song.artist_name = details[0]
    name = details[1].gsub(".mp3", "")
    song.name = name
    song
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    self.all << song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

end


hello = Song.create_by_name("hello")
goodby = Song.create_by_name("goodbye")

#binding.pry