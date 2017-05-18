require_relative '../lib/bitmap'
require_relative '../spec/spec_helper'

describe Bitmap do
  before :each do
    @test_command = [[:new, ["5", "6"]], [:colour, ["1", "3", "A"]], [:vline, ["2", "3", "6", "W"]], [:hline, ["3", "5", "2", "Z"]]]
    @bitmap = Bitmap.new(*['5', '6'])
    @empty_list = Array.new(6) { Array.new(5, '0')}
    @list = Array.new(6) { Array.new(5, '0')}
  end

  context ":clear()" do
    before :each do
      @bitmap = Bitmap.new(*['5', '6'])
      @empty_list = Array.new(6) { Array.new(5, '0')}
    end


    it "data should be empty_list" do
      expect(@bitmap.data).to eq @empty_list
    end

    it "should fill @data with '0'" do
      @bitmap.clear
      expect(@bitmap.data).to eq @empty_list
    end
  end

  context ":bounds?()" do

    it "returns true for in bound" do
      expect(@bitmap.bounds?(5,6)).to eq true
    end

    it "returns false for out bound Y" do
      expect(@bitmap.bounds?(4,7)).to eq false
    end

    it "returns false for out bound X" do
      expect(@bitmap.bounds?(6,4)).to eq false
    end

    it "returns false for out bound X and Y" do
      expect(@bitmap.bounds?(6,7)).to eq false
    end

  end

  context ":colour()" do
    it "should fill @data with '0'" do
      @list[2][0] = 'A'
      @bitmap.colour(*["1", "3", "A"])
      expect(@bitmap.data).to eq @list
    end

    it "should print err for out of bound for Y" do
      @bitmap.colour(*["4", "7", "A"])
      expect(@bitmap.data).to eq @list
    end

    it "should print err for out of bound for X" do
      @bitmap.colour(*["6", "3", "A"])
      expect(@bitmap.data).to eq @list
    end

    it "should print err for out of bound for X and Y" do
      @bitmap.colour(*["6", "8", "A"])
      expect(@bitmap.data).to eq @list
    end

    it "should print err for out of bound for X and Y" do
      @bitmap.colour(*["-6", "-8", "A"])
      expect(@bitmap.data).to eq @list
    end
  end

  context ":hline" do
    it "should fill @data with 'Z' for command H 3 5 2 Z " do
      @list[1][2] = 'Z'
      @list[1][3] = 'Z'
      @list[1][4] = 'Z'
      @bitmap.hline *["3", "5", "2", "Z"]
      expect(@bitmap.data).to eq @list
    end

    it "should through error out of bound for command H 3 5 7 Z " do
      @bitmap.hline *["3", "5", "7", "Z"]
      expect(@bitmap.data).to eq @list
    end

    it "should through error out of bound for command H 3 8 2 Z " do
      @bitmap.hline *["3", "8", "2", "Z"]
      expect(@bitmap.data).to eq @list
    end

    it "should through error out of bound for command H 3 8 7 Z " do
      @bitmap.hline *["3", "8", "7", "Z"]
      expect(@bitmap.data).to eq @list
    end
  end

  context ":vline" do
    it "should fill @data on 2nd column from 3rd to 6th row with 'W' for command V 2 3 6 W" do
      @list[2][1] = 'W'
      @list[3][1] = 'W'
      @list[4][1] = 'W'
      @list[5][1] = 'W'
      @bitmap.vline *["2", "3", "6", "W"]
      expect(@bitmap.data).to eq @list
    end

    it "should through error out of bound for command V 2 3 6 W" do
      @bitmap.vline *["2", "3", "7", "W"]
      expect(@bitmap.data).to eq @list
    end

    it "should through error out of bound for command V 2 3 6 W" do
      @bitmap.vline *["6", "3", "6", "W"]
      expect(@bitmap.data).to eq @list
    end

    it "should through error out of bound for command V 2 3 6 W" do
      @bitmap.vline *["6", "3", "7", "W"]
      expect(@bitmap.data).to eq @list
    end
  end

end
