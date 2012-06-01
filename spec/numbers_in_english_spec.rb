require "numbers_in_english"

describe NumbersInEnglish do
  test_cases = {
    1 => "one",
    2 => "two",
    15 => "fifteen",
    30 => "thirty",
    89 => "eighty nine",
    134 => "one hundred and thirty four",
    55766 => "fifty five thousand seven hundred and sixty six",
    4999542 => "four million nine hundred and ninety nine thousand five hundred and fourty two",
    764856323 => "seven hundred and sixty four million eight hundred and fifty six thousand three hundred and twenty three",
    1000000 => "one million",
    1000 => "one thousand",
    100 => "one hundred",
    10 => "ten"
  }

  test_cases.each do |number, string_representation|
    it "should return #{string_representation} for #{number}" do
      NumbersInEnglish.new(number).to_s.should == string_representation
    end
  end

  it "should not handle numbers larger than 999,999,999" do
    expect{NumbersInEnglish.new(1000000000000).to_s}.to raise_error(NumberOutOfBoundsError, "Only support numbers less than 999,999,999")
  end
end
