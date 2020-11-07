class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.chdir(@path) do
            return @files = Dir.glob("*.mp3")
        end
    end

    def import
        self.files.each do |file|
            Song.new_by_filename(file)
        end
    end
end
