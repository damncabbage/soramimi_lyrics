module SoramimiLyrics
  class Song

    def initialize(*args)
      # Do a manual args.extract_options! - we can't rely on
      # activesupport being present.
      options = (args.last.is_a?(::Hash) ? args.pop : {}) 

      input = args.pop
      options[:format] ||= :soramimi

      @timecodes = case options[:format]
                   when :soramimi
                     @timecodes = self.class.parse(input)
                   else
                     @timecodes = input
                   end
    end

    # Convenience method to ask the parsing module for the result.
    def self.parse(source)
      SoramimiLyrics::Parsing.parse(source)
    end

    def to_timecodes
      @timecodes
    end

    def to_plain_lyrics
      ""
    end

    def to_soramimi_lyrics
      ""
    end

  end
end
