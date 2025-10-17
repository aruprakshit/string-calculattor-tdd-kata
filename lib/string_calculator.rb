def add(input, delimiter = ',')
  if input.empty?
    0
  elsif input.length == 1
    input.to_i
  else
    a, b = input.split(delimiter)
    a.to_i + b.to_i
  end
end