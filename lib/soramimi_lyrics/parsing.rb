require 'parslet'

module SoramimiLyrics
  module Parsing

    def self.parse(input)
      @parser      ||= Parser.new
      @transformer ||= Transformer.new

      begin
        tree = @parser.parse(input)
      rescue Parslet::ParseFailed => error
        puts error, @parser.root.error_tree
      end

      # TODO: Get the Transform in there.
      # @tranformer.apply(tree)
      tree
    end

    class Parser < Parslet::Parser
      # Convenience: lyrics can have ignored characters after the
      # last timecode on a line
      rule(:junk) { (line_end.absent? >> any).repeat }

      # Convenience: End of Line / Whitespace matchers
      rule(:line_end) { match('[\r\n]').repeat(1) }
      rule(:spaces)   { match('\s').repeat(1) }
      rule(:spaces?)  { spaces.maybe }

      # Elements
      rule(:syllable) { (timecode.absent? >> any).repeat(1) }
      rule(:timecode) {
        str('[') >> match('\d').repeat(1).as(:min) >>
        str(':') >> match('\d').repeat(1).as(:sec) >>
        str(':') >> match('\d').repeat(1).as(:msec) >> str(']')
      }

      # Groups
      rule(:pair) { timecode >> syllable.as(:syllable) }
      rule(:line) { (pair.repeat >> timecode).as(:line) >> junk.maybe >> line_end }
      rule(:song) { line.repeat.as(:lines) }

      root :song
    end

    class Transformer < Parslet::Transform
      # TODO
      rule(:min => simple(:min), :sec => simple(:sec), :msec => simple(:msec), :syllable => simple(:text)) {
        {:min => min, :text => text}
      }
      rule(:min => simple(:min), :sec => simple(:sec), :msec => simple(:msec)) {
        {:min => min, :text => nil}
      }
      rule(:line => sequence(:syllables)) { syllables.last.text = nil; syllables }
    end
  end
end

