require_relative '../lib/parser'
require_relative '../lib/bitmap'

class BitmapEditor
  def initialize
    @commands = []
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when 'S'
        Parser.process_input @commands
        break
      else
        @commands << Parser.parse(line)
      end
    end
    @commands
  end
end
