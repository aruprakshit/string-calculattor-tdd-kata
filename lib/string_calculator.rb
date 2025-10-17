def add(input, delimiter = ',')
  return 0 if input.empty?
  
  input
    .split(delimiter)
    .map(&:to_i)
    .sum
end