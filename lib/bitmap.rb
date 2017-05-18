class Bitmap
  attr_reader :width, :height, :data

  # Creates a new empty bitmap with white colour (O)
  def initialize(width, height)
    @width = width.to_i
    @height = height.to_i
    @data = Array.new(@height) { Array.new(@width, '0')}
  end

  def bounds?(x, y)
    (x >= 0 && x <= @width) && (y >= 0 && y <= @height)
  end

  def clear()
    @data = Array.new(@height) { Array.new(@width, '0')}
  end

  # fill colour to a pixel (x, y) with c
  def colour(x, y, c)
    x, y = x.to_i, y.to_i

    unless self.bounds?(x, y)
      puts "ERR: Coordinates out of bounds"
      return
    end

    self[y, x] = c
  end

  # draw a horizontal line with colour c from pixel(x1, y) to a pixel (x2, y)
  def hline(x1, x2, y, c)
    x1, x2, y = x1.to_i, x2.to_i, y.to_i

    unless self.bounds?(x1, y) && self.bounds?(x2, y)
      puts "ERR: Coordinates out of bounds"
      return
    end

    (x1..x2).each {|x| self[y, x] = c}
  end

  # draw a horizontal line with colour c from pixel(x1, y) to a pixel (x2, y)
  def vline(x, y1, y2, c)
    x, y1, y2 = x.to_i, y1.to_i, y2.to_i

    unless self.bounds?(x, y1) && self.bounds?(x, y2)
      puts "ERR: Coordinates out of bounds"
      return
    end

    (y1..y2).each {|y| self[y, x] = c}
  end

  private

  def []=(x, y, val)
    @data[x-1][y-1] = val
  end

end

