class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)

    numbers_array = parse_numbers(numbers, delimiter)

    check_for_negatives(numbers_array)

    numbers_array.reject! { |num| num > 1000 }
    numbers_array.sum
  end

  private

  def extract_delimiter(numbers)
    if numbers.start_with?('//')
      delimiter = numbers.match(%r{//\[(.*?)\]\n|//(.*)\n}).captures.compact.first
      numbers = numbers.split("\n")[1]
    else
      delimiter = /[,\n]/
    end
    [delimiter, numbers]
  end

  def parse_numbers(numbers, delimiter)
    numbers.split(delimiter).map(&:to_i)
  end

  def check_for_negatives(numbers_array)
    negatives = numbers_array.select(&:negative?)
    raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
  end
end