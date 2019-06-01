SECONDS_PER_YEAR = 31557600
MERCURY_ORBITAL_PERIOD = 0.2408467
VENUS_ORBITAL_PERIOD = 0.61519726
MARS_ORBITAL_PERIOD = 1.8808158
JUPITER_ORBITAL_PERIOD = 11.862615
SATURN_ORBITAL_PERIOD = 29.447498
URANUS_ORBITAL_PERIOD = 84.016846
NEPTUNE_ORBITAL_PERIOD = 164.79132
class SpaceAge
  def initialize(seconds)
    @seconds = seconds.to_f
  end

  def on_earth
    @seconds / SECONDS_PER_YEAR
  end

  def on_mercury
    on_earth / MERCURY_ORBITAL_PERIOD
  end

  def on_venus
    on_earth / VENUS_ORBITAL_PERIOD
  end

  def on_mars
    on_earth / MARS_ORBITAL_PERIOD
  end

  def on_jupiter
    on_earth / JUPITER_ORBITAL_PERIOD
  end

  def on_saturn
    on_earth / SATURN_ORBITAL_PERIOD
  end

  def on_uranus
    on_earth / URANUS_ORBITAL_PERIOD
  end

  def on_neptune
    on_earth / NEPTUNE_ORBITAL_PERIOD
  end
end
