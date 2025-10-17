def add(input, delimiter = ',')
  if input.empty?
    0
  elsif input.length == 1
    input.to_i
  else
    input
      .split(delimiter)
      .map(&:to_i)
      .reduce(0, :+)
  end
end