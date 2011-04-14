#   This filter changes all words to Title Caps, and attempts to be clever
#   about *un*capitalizing small words like a/an/the in the input.
#
#   The list of "small words" which are not capped comes from
#   the New York Times Manual of Style, plus 'vs' and 'v'.
#
#   Original Perl version by:
#     John Gruber
#     http://daringfireball.net/
#     10 May 2008
#
#   Adapted to Ruby by:
#     Marshall Elfstrand
#     http://vengefulcow.com/
#     21 May 2008
#
#   License: http://www.opensource.org/licenses/mit-license.php
#
module HarukiZaemon
  module Titleizer
    class << self
      attr_accessor :replace_punctuation
    end
    self.replace_punctuation = true
    
    module String
      SMALL_WORDS = %w( is a an and as at but by en for if in of on or the to v[.]? via vs[.]? )
      SMALL_RE = SMALL_WORDS.join('|')

      def titleize
        result = ""
        with_puntuation_replaced = Titleizer.replace_punctuation ? self.gsub(/[_-]/, ' ') : self
        with_puntuation_replaced.split(/( [:.;?!][ ] | (?:[ ]|^)["“] )/x).each do |s|
          s.gsub!(/ \b( [[:alpha:]] [[:lower:].'’]* )\b /x) do |w|
            # Skip words with inresult dots, e.g. "del.icio.us" or "example.com"
            (w =~ / [[:alpha:]] [.] [[:alpha:]] /x) ? w : w.capitalize
          end #gsub!

          # Lowercase our list of small words:
          s.gsub!(/\b(#{SMALL_RE})\b/io) { |w| w.downcase }

          # If the first word in the title is a small word, then capitalize it:
          s.gsub!(/\A([[:punct:]]*)(#{SMALL_RE})\b/io) { |w| $1 + $2.capitalize }

          # If the last word in the title is a small word, then capitalize it:
          s.gsub!(/\b(#{SMALL_RE})([[:punct:]]*)\Z/io) { |w| $1.capitalize + $2 }

          # Append current substring to output
          result += s
        end #each

        # Special Cases:
        result.gsub!(/ V(s?)\. /, ' v\1. ')               # "v." and "vs."
        result.gsub!(/(['’])S\b/, '\1s')                  # 'S (otherwise you get "the SEC'S decision")
        result.gsub!(/\b(AT&T|Q&A)\b/i) { |w| w.upcase }  # "AT&T" and "Q&A", which get tripped up by
                                                        # self-contained small words "at" and "a"

        result
      end
      alias_method :titlecase, :titleize
      
      def titleize!
        self.replace(self.titleize)
      end
      alias_method :titlecase!, :titleize!
    end
  end
end
