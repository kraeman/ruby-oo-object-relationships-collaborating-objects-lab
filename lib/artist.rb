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
        song.artist_name = self.name
    end

    def self.find_or_create_by_name(string)
        k = self.all.select {|i| i.name == string}
        if k != []
            k[0]
        else
            self.new(string)
        end
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end
end