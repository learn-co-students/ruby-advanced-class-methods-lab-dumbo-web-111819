class Song
  attr_accessor :name,:artist_name
  @@all = []

  def self.all
    @@all
  end

  def initialize(options={})
    @name= options[:name] || nil 
    @artist_name=options[:artist_name] || nil 
  end

  def self.create
    Song.new.save
    @@all.last
  end
  
  def self.new_by_name(name)
    Song.new(name: name)
  end

  def self.create_by_name(name)
    Song.new_by_name(name).save
    @@all.last
  end

  def self.find_by_name(name)
    song_list=Song.all.find {|song| song.name == name}
    return unless song_list
    song_list
  end

  def self.find_or_create_by_name(name)
    #Song.create_by_name(name) unless Song.find_by_name(name)
    find_song=Song.find_by_name(name)
    if find_song == nil
      Song.create_by_name(name)
    else
      find_song
    end
  end
  
  def self.alphabetical
    song_order=self.all.sort_by {|song| song.name}
    song_order
  end
  
  def self.new_from_filename(artist_name_string)
    split_string=artist_name_string.split("-")
    split_string=split_string.map {|element| element.strip}
    Song.new(name: split_string[1].split(".")[0], artist_name:split_string[0])
  end

  def self.create_from_filename(name)
    Song.new_from_filename(name).save
    #@@all.last
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
