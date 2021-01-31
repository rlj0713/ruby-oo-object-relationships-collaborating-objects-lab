class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @artist = Artist
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name
        self.artist.name
    end

    def self.new_by_filename(argument)
        array = argument.split(" - ")
        new_song = self.new(array[1])
        mj = Artist.find_or_create_by_name(array[0])
        mj.add_song(new_song)
        new_song
    end

    def artist_name=(artist_name)
        @artist = Artist.find_or_create_by_name(artist_name)
    end

end