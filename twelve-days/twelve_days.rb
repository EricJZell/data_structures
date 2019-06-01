class TwelveDays
  GIFTS = {
    'first' => 'a Partridge in a Pear Tree.',
    'second' => 'two Turtle Doves',
    'third' => 'three French Hens',
    'fourth' => 'four Calling Birds',
    'fifth' => 'five Gold Rings',
    'sixth' => 'six Geese-a-Laying',
    'seventh' => 'seven Swans-a-Swimming',
    'eighth' => 'eight Maids-a-Milking',
    'ninth' => 'nine Ladies Dancing',
    'tenth' => 'ten Lords-a-Leaping',
    'eleventh' => 'eleven Pipers Piping',
    'twelfth' => 'twelve Drummers Drumming'
  }
  def self.song
    song = ''
    GIFTS.each_with_index do |(day, gift), index|
      song += "On the #{day} day of Christmas my true love gave to me: "
      song += GIFTS.values[0..index].reverse.join(', ') + "\n\n"
    end
    song.gsub(/, a Partridge/, ', and a Partridge').chomp
  end
end
