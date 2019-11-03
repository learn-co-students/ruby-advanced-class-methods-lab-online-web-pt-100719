class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create(song)
    song = Song.create
    Song.all.include?(song)
    save
  end
end
