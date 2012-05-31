require "numbers_in_english"

describe NumbersInEnglish do
  test_cases = {
    1 => "one",
    2 => "two",
    15 => "fifteen"
  }

  test_cases.each do |number, string_representation|
    it "should return #{string_representation} for #{number}" do
      NumbersInEnglish.new(number).to_s.should == string_representation
    end
  end

  it "should return thirty for 30" do
    NumbersInEnglish.new(30).to_s.should == "thirty"
  end

  it "should return eight nine for 89" do
    NumbersInEnglish.new(89).to_s.should == "eighty nine"
  end

  it "should return one hundred thirty four for 134" do
    NumbersInEnglish.new(134).to_s.should == "one hundred thirty four"
  end

  it "should return fifty five thousand seven hundred sixty six for 55766" do
    NumbersInEnglish.new(55766).to_s.should == "fifty five thousand seven hundred sixty six"
  end

end
