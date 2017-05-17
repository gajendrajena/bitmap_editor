class Bitmap
  attr_reader :width, :height, :data

  def initialize(width, height)
    # Creates a new empty bitmap with white colour (O)
    @width = width.to_i
    @height = height.to_i
    @data = Array.new(@width * @height, 'O')
  end

  def bounds?(x, y)
    x <= @width && y <= @height
  end

  def [](x, y)
    @data[(y-1)*@width+(x-1)]
  end

  def []=(x, y, val)
    @data[(y-1)*@width+(x-1)] = val
  end

  def rows
    @data.each_slice(@width)
  end

  def dot(x, y, c)
    puts "dot : #{x}, #{y}, #{c}"
  end

  def fill()
    puts "fill "
  end

  def hline(x1, x2, y, c)
    puts "hline : #{x1}, #{x2}, #{y}, #{c}"
  end

  def vline(x, y1, y2, c)
    puts "vline : #{x}, #{y1}, #{y2}, #{c}"
  end


end

