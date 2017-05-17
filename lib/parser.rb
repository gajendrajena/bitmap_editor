class Parser
  PARSE_EXP = {
    new: /I (\d+) (\d+)/,
    dot: /L (\d+) (\d+) ([A-Z])/,
    fill: /F (\d+) (\d+) ([A-Z])/,
    hline: /H (\d+) (\d+) (\d+) ([A-Z])/,
    vline: /V (\d+) (\d+) (\d+) ([A-Z])/,
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
        @bitmap.send(command, *params) if @bitmap
      end
    end
  end


end
