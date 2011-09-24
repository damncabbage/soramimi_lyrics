module SoramimiLyrics
  autoload :Base, "soramimi_lyrics/base"

  def self.import(*args)
    # Do a manual args.extract_options! - we can't rely on
    # activesupport being present.
    options = (args.last.is_a?(::Hash) ? args.pop : {}) 

    text = args.pop
    if options[:file] && options[:file].length > 0
      text = File.open(options[:file], 'rb') { |f| f.read }
    end

    SoramimiLyrics::Base.new(text)
  end
    
end
