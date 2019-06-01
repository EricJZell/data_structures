class Clock
  attr_reader :hour, :minute
  def initialize(hour: 0, minute: 0)
    @hour = (hour + (minute / 60)) % 24
    @minute = minute % 60
  end

  def to_s
    @hour.to_s.rjust(2, '0') + ':' + @minute.to_s.rjust(2, '0')
  end

  def +(clock2)
    Clock.new(hour: hour + clock2.hour, minute: minute + clock2.minute)
  end

  def -(clock2)
    Clock.new(hour: hour - clock2.hour, minute: minute - clock2.minute)
  end

  def ==(clock2)
    hour == clock2.hour && minute == clock2.minute
  end
end
