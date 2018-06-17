matrix = [
  [1,1,1,1,1,1],
  [1,1,1,1,1,1],
  [0,0,0,0,0,0],
  [1,1,1,1,1,1],
  [0,0,0,0,0,0],
  [1,1,1,1,1,1],
  [1,1,1,1,1,1],
  [1,1,1,1,1,1],
  [0,0,0,0,0,0],
  [1,1,1,1,1,1],
  [0,0,0,0,0,0],
  [1,1,1,1,1,1],
  [1,1,1,1,1,1]
]

# Runtime complexity is linear, O(n), where n is total nodes in the matrix
# However, it is more accurately n + 9k, where k is the number of '1' nodes.

def islands(matrix)
  @ops = 0
  @matrix = matrix
  @visited = []
  islands = 0
  @max_width = @matrix[0].length - 1
  @max_height = @matrix.length - 1
  for i in (0..@max_height) do
    for j in (0..@max_width) do
      @ops +=1
      if @matrix[i][j] == 1 && !@visited.include?([i, j])
        islands += 1
        visit(i, j)
      end
    end
  end
  islands
end

def visit(i, j)
  @visited << [i, j]
  for m in (i - 1..i + 1) do
    for n in (j - 1..j + 1) do
      @ops += 1
      if (0..@max_height).include?(m) && (0..@max_width).include?(n)
        if @matrix[m][n] == 1 && !@visited.include?([m, n])
          visit(m, n)
        end
      end
    end
  end
end

puts islands(matrix)
puts @ops
