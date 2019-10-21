require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end
  
  def self.create_by_name(create_title)
    song = self.create
    song.name = create_title
    song
  end
 
  def self.find_by_name(find_title)
    found_name = self.all.detect{|person| person.name == find_title}
    found_name
  end
  
  def self.find_or_create_by_name(new_name)
    found_name = self.find_by_name(new_name)
    found_name ? found_name : self.create_by_name(new_name)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    new_arr = filename.split(" - ")
    new_arr[1] = new_arr[1].chomp(".mp3")
    song = self.new
    song.artist_name = new_arr[0]
    song.name = new_arr[1]
    song
  end
  
  def self.create_from_filename(filename)
    new_arr = filename.split(" - ")
    new_arr[1] = new_arr[1].chomp(".mp3")
    song = self.new
    song.artist_name = new_arr[0]
    song.name = new_arr[1]
    song.save
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
