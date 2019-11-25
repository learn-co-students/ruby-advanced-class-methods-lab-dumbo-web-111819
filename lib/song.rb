require 'pry'
class Song
  attr_accessor  :artist_name, :name
  @@all = []
  def initialize (name = "song")
    @name = name
    @@all << self
  end
  
  

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

  def self.new_by_name(n)
    song = Song.new(n)
 
    song
  end
  def self.create_by_name(name)
    song = Song.new(name)
    # song.save
  end
  def self.find_by_name(name)
    Song.all.find{|song|song.name == name}
  end
  def self.find_or_create_by_name (name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
    # binding.pry
  end
  def self.alphabetical
    @@all.sort_by(&:name)
  end
  def self.new_from_filename(file_name)
    
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    new_song
  end
  def self.create_from_filename(file_name)
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    new_song
  end
  def self.destroy_all
    @@all.clear
  end
end
"hi"