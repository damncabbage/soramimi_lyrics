Soramimi Lyrics
===============

A [Soramimi Karaoke](http://soramimi.nl) lyrics parser. Lyrics go in, objects come out; can't explain that.


Install it:

```
gem install soramimi-lyrics
```

Grab your lyrics:

```
require 'soramimi-lyrics'

# Parse straight from a string:
song = SoramimiLyrics.parse(lyrics_string)

# Open up a file:
song = SoramimiLyrics.load('/path/to/soramimi/lyrics.txt')

# Or build it up:
song = SoramimiLyrics.new
song.add_line(%w{ Oh man! })
# ...

```

Now spit the contents back out in varying formats:

```
# Directly compatible with Soramimi Karaoke (ostensibly the original if imported from a file or string).
song.to_soramimi_lyrics
  => "[01:06:07]Beat[01:06:30]ing [01:06:56]up [01:06:83]the [01:07:09]wrong [01:07:52]guy[01:08:03]\n[01:08:50]Oh [01:08:93]man![01:09:48]"

song.to_plain_lyrics
  => "Beating up the wrong guy\nOh man!"

song.to_timecodes
  => [
       [ { :syllable => "Beat", :begin => 66070, :end => 66300 },
	     { :syllable => "ing ", :begin => 66300, :end => 66560},
         { :syllable => "up ", :begin => 66560, :end => 66830 },
         { :syllable => "the ", :begin => 66830, :end => 67090 },
         { :syllable => "wrong ", :begin => 67090, :end => 67520 },
         { :syllable => "guy", :begin => 67520, :end => 68030 } ],
       [ { :syllable => "Oh ", :begin => 68500, :end => 68930 },
         { :syllable => "man!", :begin => 68930, :end => 69480 } ]
     ]
```


Notes
-----

English songs have a high rate of one-syllable-per-word lyrics. Japanese, on the other hand, is dense as hell:

* `Beat|ing up the wrong guy / Oh man!`: 6 one-syllable words, 1 two-syllable words.
* `Fu|ki|ton|de yu|ku fu|u|kei / ko|ru|ga|ru yo|u ni ma|e`: 2 four-syllable, 1 three-syllable, 3 two-syllable, 1 one-syllable "words".

(Soramimi Karaoke was originally made for displaying Japanese song lyrics in Rōmaji, and so the `to_timecodes` return format is targeted at this.)


License
-------

Copyright (c) 2011 Robert Howard

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
