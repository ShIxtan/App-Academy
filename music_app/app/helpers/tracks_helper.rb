module TracksHelper
  def ugly_lyrics(lyrics)
    lines = lyrics.split("\n")
    ugly_lyrics = lines.map { |line| '&#9835' + h(line) }.join
    ugly_lyrics = '<pre>' + ugly_lyrics + '</pre>'

    ugly_lyrics.html_safe
  end
end
