require File.dirname(__FILE__) + '/../../../lib/haruki_zaemon/titleizer/string.rb'
require File.dirname(__FILE__) + '/../../../lib/titleizer'

describe String do
  describe "#titleize" do
    it "should return a new string" do
      original = "have a nice day"
      titleized = original.titleize
      original.should_not === titleized
    end

    it "should always capitalise the first word" do
      "a b".titleize.should =~ /^A/
    end

    it "should always capitalise the last word" do
      "a b".titleize.should =~ /B$/
    end

    %w(is a an and as at but by en for if in of on or the to via vs).each do |word|
      it "should not capitalise '#{word}'" do
        "X #{word} Y".titleize.should == "X #{word} Y"
      end
    end

    %w{- _}.each do |punc|
      it "should convert '#{punc}' to spaces" do
        "a#{punc}title".titleize.should == "A Title"
      end
    end

    it "should capitalise according to title case rules" do
      "once upon a time in a far off land".titleize.should == "Once Upon a Time in a Far Off Land"
    end
  end
  
  describe "#titleize!" do
    it "should replace the contents of the string" do
      original = "have a nice day"
      titleized = original.titleize!
      original.should === titleized
    end
  end
end
