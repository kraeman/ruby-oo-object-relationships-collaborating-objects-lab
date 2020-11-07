class Song
    @@all = []

    attr_accessor :name, :artist
    attr_reader :artist_name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        h = file.split(" - ")
        thing = self.new(h[1])
        a_name = h[0]
        thing.artist_name=(a_name)
        thing
    end

    def artist_name=(artist_name)
        @artist_name = artist_name
        k = Artist.all.select {|i| i.name == @artist_name}
        if k != []
            @artist = k.first
            @artist
        else
            @artist = Artist.new(@artist_name)
            @artist
        end
    end

end