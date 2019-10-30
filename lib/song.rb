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
  
  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end
  
  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    song
  end
  
  def self.find_by_name(title)
    found = self.all.detect{|person| person.name == title}
    found
  end
  
  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    found ? found : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
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

end
