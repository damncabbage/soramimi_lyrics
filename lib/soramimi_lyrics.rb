module SoramimiLyrics
  autoload :Song,    "soramimi_lyrics/song"
  autoload :Parsing, "soramimi_lyrics/parsing"

  def self.parse(text)
    SoramimiLyrics::Song.new(text, :format => :soramimi)
  end

  def self.load(path)
    text = File.open(path, 'rb') { |f| f.read }
    SoramimiLyrics::Song.new(text, :format => :soramimi)
  end
    
end
