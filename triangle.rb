class Triangle
  def self.blocks(rows)
    return rows if rows <= 1
    return rows + blocks(rows - 1)
  end
end
