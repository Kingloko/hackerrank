class CountLuck

  attr_accessor :matrix
  def initialize
    @matrix = []
    @num_wand_waves = 0
  end

  def impressed?(k)
    dfs([], 0, *find('M'))
    k == @num_wand_waves ? 'Impressed' : 'Oops!'
  end

  private

  def dfs(visited, wand_waves, y, x)
    @num_wand_waves = wand_waves if is_star?(y, x)
    valid_moves = valid_moves(y, x, visited)
    wand_waves += 1 if valid_moves.size > 1

    valid_moves.each do |neighbor|
      visited << neighbor
      dfs(visited.clone, wand_waves, *neighbor)
    end
  end

  def valid_moves(y, x, visited)
    (neighbors(y, x) - visited).select { |neighbor| is_valid?(*neighbor) }
  end

  def neighbors(y, x)
    neighbors = []
    neighbors << [y + 1, x] if y + 1 < matrix.size
    neighbors << [y, x + 1] if x + 1 < matrix.first.size
    neighbors << [y - 1, x] if y > 0
    neighbors << [y, x - 1] if x > 0
    neighbors
  end

  def is_valid?(y, x)
    is_path?(y, x) || is_star?(y, x)
  end

  def is_path?(y, x)
    matrix[y][x] == '.'
  end

  def is_star?(y, x)
    matrix[y][x] == '*'
  end

  def find(to_find)
    matrix.each_with_index do |row, y|
      row.each_with_index do |element, x|
        return y, x if to_find == element
      end
    end
  end

end

t = gets.to_i
t.times do
  countLuck = CountLuck.new
  n, _ = gets.split(' ').map(&:to_i)
  n.times { countLuck.matrix << gets.split(//) }
  k = gets.to_i
  puts countLuck.impressed?(k)
end
