require_relative '../lib/bitmap_editor'
require './spec_helper'

describe BitmapEditor do
  before :each do
    @bitmap_editor = BitmapEditor.new
    @test_command = [[:new, ["5", "6"]], [:dot, ["1", "3", "A"]], [:vline, ["2", "3", "6", "W"]], [:hline, ["3", "5", "2", "Z"]]]
  end

  it "should parse show.txt file and return the commands" do
    expect(@bitmap_editor.run('../examples/show.txt')).to eq @test_command
  end
end
