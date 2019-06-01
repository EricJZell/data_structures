class ResistorColorDuo
  COLOR_CODES = {
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
  }
  def self.value(color_array)
    color_array.inject(0){ |total, band| (total * 10) + COLOR_CODES[band] }
  end
end
