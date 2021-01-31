
require 'pathname'

class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.chdir(@path) do | path |
            Dir.glob("*.mp3")
        end
    end

    def import
        files = self.files
        files.each do |file|
            new_song = Song.new_by_filename(file)
        end
    end

end