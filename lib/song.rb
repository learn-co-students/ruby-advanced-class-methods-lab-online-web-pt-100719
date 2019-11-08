class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all #=> Song.all
    @@all # => Displays all instances of Song
  end

  def save
    self.class.all << self
  end

  def self.create # => Creates instances of our Song class
    song = self.new # => step = Song.new
    self.all << song # => Song.all << step
    song # => step
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title) # => Creates an instance of class using a passed-in name
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title) # => Finds an instance of a class by name
    result = self.all.detect do |song|
      song.name == title
    end
    result
  end

  def self.find_or_create_by_name(title)
    result = self.find_by_name(title) # => Refers to a previous class method
    if result # => If result exists, return the result.
      result
    else # Else create the result by passing in the song's title
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.create
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
