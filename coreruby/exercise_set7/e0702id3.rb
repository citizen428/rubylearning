#!/usr/bin/ruby

=begin
  Write a Ruby program that analyzes an MP3 file. Many MP3 files have a 128-
  byte data structure at the end called an ID3 tag. These 128 bytes are
  literally packed with information about the song: its name, the artist,
  which album it's from, and so on. You can parse this data structure by
  opening an MP3 file and doing a series of reads from a position near the
  end of the file. According to the ID3 standard, if you start from the
  128th-to-last byte of an MP3 file and read three bytes, you should get
  the string TAG. If you don't, there's no ID3 tag for this MP3 file, and
  nothing to do. If there is an ID3 tag present, then the 30 bytes after TAG
  contain the name of the song, the 30 bytes after that contain the name of
  the artist, and so on. A sample song.mp3 file is available to test your
  program. Use Symbols, wherever possible.
=end

class MyD3
  GENRES = [:Blues, :'Classic Rock', :Country, :Dance, :Disco, :Funk, :Grunge, :'Hip-Hop', :Jazz,
    :Metal, :'New Age', :Oldies, :Other, :Pop, :'R&B', :Rap, :Reggae, :Rock, :Techno, :Industrial,
    :Alternative, :Ska, :'Death Metal', :Pranks, :Soundtrack, :'Euro-Techno', :Ambient, :'Trip-Hop',
    :Vocal, :'Jazz+Funk', :Fusion, :Trance, :Classical, :Instrumental, :Acid, :House, :Game,
    :'Sound Clip', :Gospel, :Noise, :AlternRock, :Bass, :Soul, :Punk, :Space, :Meditative,
    :'Instrumental Pop', :'Instrumental Rock', :Ethnic, :Gothic, :Darkwave, :'Techno-Industrial',
    :Electronic, :'Pop-Folk', :Eurodance, :Dream, :'Southern Rock', :Comedy, :Cult, :Gangsta,
    :'Top 40', :'Christian Rap', :'Pop/Funk', :Jungle, :'Native American', :Cabaret, :'New Wave',
    :Psychadelic, :Rave, :Showtunes, :Trailer,:'Lo-Fi', :Tribal, :'Acid Punk', :'Acid Jazz', :Polka,
    :Retro, :Musical, :'Rock & Roll', :'Hard Rock' ]

  def initialize(fn)
    raise RuntimeError, "File #{fn} not found" unless File.exist?(fn)
    @filename = fn
    tag, @song, @artist, @album, @year, @comment, genre_id =
      File.new(fn).read[-128..-1].unpack("A3A30A30A30A4A30C")
    raise RuntimeError, "No ID3 Tags found" unless tag == 'TAG'
    @genre = GENRES[genre_id].to_s
    if @comment[28] == 0 && @comment[29] != 0
      @track = @comment[29].to_s
      @comment = @comment[0..27]
    else
      @track = 'n/a'
    end
  end

  attr_reader :filename, :song, :artist, :album, :year, :comment, :genre, :track

  def pp_tags(*tags)
    output="ID3v1 Tags for #{filename}\n"
    output << "#{'=' * 50}\n"
    tags.each do |t|
      output << "%10s: " % t.to_s.capitalize << "#{self.send(t)}\n"
    end
    output << "#{'-' * 50}\n"
  end
end

# Test code
begin
  s = MyD3.new('song.mp3')
rescue
  puts "Error: #{$!}"
  exit 1
end

puts s.pp_tags(:song, :artist, :album, :year, :comment, :genre, :track)
puts
puts s.pp_tags(:song, :year)
puts
puts "'#{s.song}' by #{s.artist} is track ##{s.track} on the album #{s.album}."
