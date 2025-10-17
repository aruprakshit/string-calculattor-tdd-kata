class StringCalculator
  DEFAULT_DELIMITERS = [',', "\n"].freeze
  
  def self.add(input, delimiter = nil)
    new(input, delimiter).calculate
  end
  
  def initialize(input, delimiter = nil)
    @input = input
    @delimiter = delimiter
  end
  
  def calculate
    return 0 if @input.empty?
    
    if custom_delimiter_format?
      process_custom_delimiter_input
    else
      process_standard_input
    end
  end
  
  private
  
  def custom_delimiter_format?
    @input.start_with?('//')
  end
  
  def process_custom_delimiter_input
    parts = @input.split("\n", 2)
    return 0 if parts.length != 2
    
    custom_delimiter = parts[0][2..-1]  # Remove '//' prefix
    numbers_string = parts[1]
    
    self.class.add(numbers_string, custom_delimiter)
  end
  
  def process_standard_input
    validate_input
    parse_and_sum_numbers
  end
  
  def validate_input
    delimiters = @delimiter ? Array(@delimiter) : DEFAULT_DELIMITERS
    delimiter_pattern = Regexp.union(delimiters)
    
    if @input.match?(/#{delimiter_pattern}#{delimiter_pattern}/)
      raise RuntimeError, "Invalid string"
    end
    
    validate_no_negative_numbers(delimiters)
  end
  
  def validate_no_negative_numbers(delimiters)
    delimiter_pattern = Regexp.union(delimiters)
    numbers = @input.split(delimiter_pattern).map(&:to_i)
    negative_numbers = numbers.select(&:negative?)
    
    if negative_numbers.any?
      raise RuntimeError, "negative numbers not allowed <#{negative_numbers.first}>"
    end
  end
  
  def parse_and_sum_numbers
    delimiters = @delimiter ? Array(@delimiter) : DEFAULT_DELIMITERS
    delimiter_pattern = Regexp.union(delimiters)
    
    @input
      .split(delimiter_pattern)
      .map(&:to_i)
      .sum
  end
end