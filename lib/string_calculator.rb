def add(input, delimiter = nil)
  return 0 if input.empty?
  
  delimiters = delimiter ? Array(delimiter) : [',', "\n"]
  
  # Validate input for consecutive delimiters
  delimiter_pattern = Regexp.union(delimiters)
  if input.match?(/#{delimiter_pattern}#{delimiter_pattern}/)
    raise RuntimeError, "Invalid string"
  end
  
  input
    .split(delimiter_pattern)
    .map(&:to_i)
    .sum
end