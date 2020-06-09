require 'pry'
class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select { |song| song.artist == self }
    end

    def print_songs
        songs.collect { |song| puts song.name }
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        if self.all == []
            Artist.new(name)
        else 
            self.all.each do |artist|
                if artist.name
                    return artist
                else 
                    Artist.new(name)
                end
            end
        end
    end

end