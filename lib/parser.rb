class Parser
  PARSE_EXP = {
    new: /I (\d+) (\d+)/,
    colour: /L (\d+) (\d+) ([A-Z])/,
    hline: /H (\d+) (\d+) (\d+) ([A-Z])/,
    vline: /V (\d+) (\d+) (\d+) ([A-Z])/,
    clear: /C/,
    show: /S/
  }

  # Search for all reg exp matches to given command
  def self.parse(line)
    cmd, re = PARSE_EXP.find{|operator, re| re.match(line)}
    [cmd, re.match(line).to_a[1..-1]]
  end

  def self.process_input commands
    commands.each do |command, params|
      case command
      when :new
        @bitmap = Bitmap.new(*params)
      else
        unless @bitmap
          puts "ERR: No bitmap has been created"
          break
        end

        @bitmap.send(command, *params)
      end
    end

    @bitmap.data.each do|arr|
      arr.each do|ar|
        print ar
      end
      puts "\n"
    end unless @bitmap.nil? && @bitmap.data.empty?
    @bitmap.data
  end
end
