require 'pry'
matrix = [[1,0,1],
          [0,0,0],
          [1,0,1]]
class IslandHopping
  attr_reader :matrix, :max_row, :max_column, :visited
  def initialize(matrix)
    @matrix = matrix
    @max_row = matrix.length - 1
    @max_column = matrix[0].length - 1
    @visited = []
    @islands = 0
  end

  def count_islands
    for i in (0..max_row) do
      for j in (0..max_column) do
        if matrix[i][j] == 1 && !visited.include?([i, j])
          @islands += 1
          visit(i, j)
        end
      end
    end
    @islands
  end

  private
  
  def visit(i, j)
    @visited << [i, j]
    for m in ((i - 1)..(i + 1)) do
      for n in ((j - 1)..(j + 1)) do
        if unvisited_land?(m, n)
          visit(m, n)
        end
      end
    end
  end

  def unvisited_land?(m, n)
    inbounds?(m, n) && !visited.include?([m, n]) && matrix[m][n] == 1
  end

  def inbounds?(i, j)
    (0..max_row).include?(i) && (0..max_column).include?(j)
  end
end
