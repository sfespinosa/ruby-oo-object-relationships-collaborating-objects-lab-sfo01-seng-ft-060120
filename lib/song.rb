class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        song_name = file.split(" - ")
        song = Song.new(song_name[1])
        song.artist_name=(song_name[0])
        song
    end
end