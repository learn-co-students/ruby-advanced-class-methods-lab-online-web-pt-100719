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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  #def remove_extension(filename)
   # filename.chomp(".mp3")
  #end

  #def split_and_remove(filename)
   # split_filename = filename.chomp(".mp3").split(" - ")
    #split_filename
  #end

  #def return_split
   # artist_name = split_filename[0]
    #song_name = split_filename[1]
  #end

  def self.new_from_filename(filename)
    split_filename =  filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    split_filename =  filename.chomp(".mp3").split(" - ")
    song = self.create
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.destroy_all
    self.all.clear    
  end

end
