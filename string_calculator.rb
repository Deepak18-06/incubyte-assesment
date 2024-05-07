class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?('//')
      delimiter = numbers[2]
      numbers = numbers.split("\n")[1]
      numbers_array = numbers.split(delimiter).map(&:to_i)
    else
      numbers_array = numbers.split(/[,\n]/).map(&:to_i)
    end
    negatives = numbers_array.reject(&:positive?)
    raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
    numbers_array.sum
  end
end