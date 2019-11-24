require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end

  def self.new_by_name(input)
    song = self.new
    song.name = input
    song
  end

  def self.create_by_name(input)
    song = self.create
    song.name = input
    song
  end

  def self.find_by_name(input)
    self.all.detect { |song| song.name == input }
  end

  def self.find_or_create_by_name(input)
    if self.find_by_name(input)
      self.find_by_name(input)
    else
      self.create_by_name(input)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(input)
    input.delete_suffix!(".mp3")
    song = self.new
    song.artist_name = input.split(" - ")[0]
    song.name = input.split(" - ")[1]
    song
  end

  def self.create_from_filename(input)
    song = self.new_from_filename(input)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end

end

# "Thundercat - For Love I Come.mp3"