def add(input, delimiter = nil)
  return 0 if input.empty?
  
  delimiters = delimiter ? Array(delimiter) : [',', "\n"]
  
  input
    .split(Regexp.union(delimiters))
    .map(&:to_i)
    .sum
end