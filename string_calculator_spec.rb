require './string_calculator'

RSpec.describe StringCalculator do
  subject(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'with an empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'with a single number' do
      it 'returns the same number' do
        expect(calculator.add('1')).to eq(1)
      end
    end

    context 'with two numbers' do
      it 'returns the sum of the two numbers' do
        expect(calculator.add('1,5')).to eq(6)
      end
    end

    context 'with multiple numbers' do
      it 'returns the sum of all numbers' do
        expect(calculator.add('1,2,3,4,5')).to eq(15)
      end
    end

    context 'with numbers separated by new lines' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'with a custom delimiter' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'with a custom delimiter &' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("//&\n1&2")).to eq(3)
      end
    end

    context 'with an invalid input' do
      it 'returns the sum of valid numbers' do
        expect(calculator.add("1,\n")).to eq(1)
      end
    end

    context 'with a single negative number' do
      it 'raises an exception' do
        expect { calculator.add("-1") }.to raise_error(ArgumentError, 'Negative numbers not allowed: -1')
      end
    end

    context 'with multiple negative numbers' do
      it 'raises an exception' do
        expect { calculator.add("-1,-2,-3") }.to raise_error(ArgumentError, 'Negative numbers not allowed: -1, -2, -3')
      end
    end

    context 'with numbers greater than 1000' do
      it 'returns the sum of valid numbers' do
        expect(calculator.add("1,1001")).to eq(1)
      end
    end

    context 'with a custom delimiter of any length' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end
  end
end