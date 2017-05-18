require_relative '../lib/bitmap_editor'
require_relative '../lib/parser'
require_relative '../spec/spec_helper'

describe Parser do

  context "self.parse should parse each line from show.txt file and return the command and params for the command" do
    it 'should be able to parse and return for new' do
      expect(Parser.parse('I 5 6')).to eq [:new, ["5", "6"]]
    end

    it 'should be able to parse and return for colour' do
      expect(Parser.parse('L 1 3 A')).to eq [:colour, ["1", "3", "A"]]
    end

    it 'should be able to parse and return for vline' do
      expect(Parser.parse('V 2 3 6 W')).to eq [:vline, ["2", "3", "6", "W"]]
    end

    it 'should be able to parse and return for hline' do
      expect(Parser.parse('H 3 5 2 Z')).to eq [:hline, ["3", "5", "2", "Z"]]
    end

    it 'should be able to parse and return for clear' do
      expect(Parser.parse('C')).to eq [:clear, []]
    end

  end

  context "self.process_input should return processed commands" do
    before :each do
      @test_command = [[:new, ["5", "6"]], [:colour, ["1", "3", "A"]], [:vline, ["2", "3", "6", "W"]], [:hline, ["3", "5", "2", "Z"]]]
      @output = [["0", "0", "0", "0", "0"], ["0", "0", "Z", "Z", "Z"], ["A", "W", "0", "0", "0"], ["0", "W", "0", "0", "0"], ["0", "W", "0", "0", "0"], ["0", "W", "0", "0", "0"]]
    end

    it 'should be able to parse and return for new' do
      expect(Parser.process_input(@test_command)).to eq @output
    end

  end
end
