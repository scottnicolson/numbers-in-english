class NumberOutOfBoundsError < RuntimeError; end

class NumbersInEnglish
  
  def self.scale
    h = {}
    %w{one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen}.each_with_index do |number, index|
      h[(index + 1)] = number
    end
    %w{twenty thirty fourty fifty sixty seventy eighty ninety}.each_with_index do |number, index|
      h[((index+2) *10)] = number
    end
    h.merge({100 => "hundred", 1000 => "thousand", 1000000 => "million"})
  end

  def initialize number
    @number = number
  end

  def to_s
    raise NumberOutOfBoundsError, "Only support numbers less than 999,999,999" if @number > 999999999
    deconstruct_number.map do |number|
      self.class.scale.fetch number
    end.join(" ").gsub(/hundred /, "hundred and ")
  end

  def deconstruct_number(number = @number)
    map = []
    magnitude = calculate_magnitude(number)
    if number < 20
      map << number
    else
      quotient, modulus = number.divmod(magnitude)
      if quotient > 0
        if magnitude >= 100
          map += deconstruct_number(quotient)
          map << magnitude unless magnitude == 10
        else
          map << quotient * magnitude
        end
      end
      if modulus < magnitude && !modulus.zero?
        map << deconstruct_number(modulus)
      end
    end
    map.flatten
  end

  def calculate_magnitude(number)
    if number >= 1000000
      1000000
    elsif number >= 1000
      1000
    elsif number >= 100
      100
    else
      10
    end
  end

end
