require 'pry'

class Song
  attr_accessor :name, :artist_name
  attr_reader
  @@all = []

  def self.create
    # binding.pry
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
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    song = self.all.find do |song_name|
      song_name.name == name
    end
    song
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song_instance| song_instance.name}
  end

  def self.new_from_filename(file_name)
    #  binding.pry
    song = self.new
    song_array = file_name.split(' - ')
    song.artist_name = song_array[0]
    song.name = song_array[1].split('.mp3').join('')
    song
  end

  def self.create_from_filename(file_name)
    self.all << self.new_from_filename(file_name)
  end
  
  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
