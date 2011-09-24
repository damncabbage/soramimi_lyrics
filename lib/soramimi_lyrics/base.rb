require 'json'

module SoramimiLyrics
  class Base

    def initialize(raw_soramimi_source)
      @raw_soramimi_source = raw_soramimi_source
    end

    def parse(source)

    end

    def to_timecodes
      []
    end

    def to_json(*args)
      to_timecodes.to_json(*args)
    end

    def to_plain_lyrics
      ""
    end

    def to_soramimi_lyrics
      ""
    end

  end
end
