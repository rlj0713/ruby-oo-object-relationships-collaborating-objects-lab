
class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(new_artist_name)
        found_artist = @@all.find{ |artist| artist.name == new_artist_name }
        if found_artist
            return found_artist
        else
            new_artist = self.new(new_artist_name)
        end
    end

    def print_songs
        array = songs
        array.each {|song| puts song.name}
    end

end