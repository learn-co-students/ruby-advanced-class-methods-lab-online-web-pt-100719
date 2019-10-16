class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
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
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if(self.find_by_name(name))
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song|
      song.name
    }
  end

  def self.new_from_filename(name)
    song = self.new
    song_format = name.split("-")
    song_format.each { |song_attribute|
      if(song_attribute.strip.include?("."))
        song.name = song_attribute.strip.split(".")[0]
      else
        song.artist_name = song_attribute.strip
      end
    }
    song
  end

  def self.create_from_filename(name)
    song = self.new
    song_format = name.split("-")
    song_format.each { |song_attribute|
      if(song_attribute.strip.include?("."))
        song.name = song_attribute.strip.split(".")[0]
      else
        song.artist_name = song_attribute.strip
      end
    }
    self.all << song
    song
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
