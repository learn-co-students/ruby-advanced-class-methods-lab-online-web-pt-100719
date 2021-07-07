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
    song.save
    song
  end
  
  def self.new_by_name(song_name)
  song = self.create
  song.name = song_name
  @song_name = song_name
  song
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    @song_name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    song = song_name
    @song = song
   if self.find_by_name(song) == nil || false
        self.create_by_name(song)
   else
      self.find_by_name(song)
   end
  end
  
  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(song_file)
    artist = song_file.split(" - ")
    artist_name = artist[0]
    song = artist[1].split(".")
    song_name = song[0]
    new_song = self.create
    new_song.artist_name = artist_name
    new_song.name = song_name
    new_song
  end
  
  def self.create_from_filename(song_file)
  song_file = self.new_from_filename(song_file)
  song_file.save
  end
  
  def self.destroy_all
  @@all.clear
end
end
