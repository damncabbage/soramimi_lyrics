module SoramimiLyrics
  class Base

    def initialize(soramimi_source)
      @soramimi_source = soramimi_source
    end

    def to_timecodes
      []
    end

    def to_plain_lyrics
      ""
    end

    def to_soramimi_lyrics
      ""
    end

  end
end
