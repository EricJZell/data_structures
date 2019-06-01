class Matrix
  def initialize(input_string)
    @input_string = input_string
  end

  def rows
    @_rows ||= begin
      @input_string
        .split("\n")
        .map{ |r| r.split(' ') }
        .map{ |r| r.map(&:to_i) }
    end
  end

  def columns
    rows.transpose
  end
end
