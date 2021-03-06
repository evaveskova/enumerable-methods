# frozen_string_literal: true

require_relative '../lib/enumerable_methods'

describe '#my_each' do
  let(:array) { [1, 7, 3, 4, 7, 8] }
  it 'returns the array' do
    expect do
      array.my_each { |a| print a }
    end.to output('173478').to_stdout
  end

  it 'returns an empty array' do
    array = []
    expect do
      array.my_each { |a| print a }
    end.to output('').to_stdout
  end
end

describe '#my_each_with_index' do
  let(:array) { [1, 7, 3, 4, 7, 8] }
  it 'returns elements and their index' do
    expect do
      array.my_each_with_index do |el, index = 0|
        puts "#{el} is in position #{index}"
      end
    end.to output("1 is in position 0\n7 is in position
      1\n3 is in position 2\n4
      is in position 3\n7
      is in position 4\n8
      is in position 5\n").to_stdout
  end
end

describe '#my_select' do
  let(:array) { [1, 7, 3, 4, 7, 8] }
  it 'returns value which are less than 7' do
    expect(array.my_select { |a| a < 7 }).to eql([1, 3, 4])
  end

  it 'does not return values less than 7' do
    expect(array.my_select { |a| a > 7 }).to eql([8])
  end
end

describe '#my_all?' do
  let(:array) { [2, 2, 2, 2, 2] }
  it 'confirms that all elements in the array are equal to 2' do
    expect(array.all? { |a| a == 2 }).to eql(true)
  end
end

it 'returns false if no elements are equal to 2' do
  expect(array.all? { |a| a == 2 }).to eql(false)
end

describe '#my_any?' do
  let(:array) { [1, 7, 3, 4, 7, 8] }
  it 'returns true if any element is even' do
    expect(array.my_any?(&:even?)).to eql(true)
  end

  it 'returns false if no element is greater than 8' do
    expect(array.my_any? { |el| el > 8 }).to eql(false)
  end
end

describe '#my_none?' do
  let(:array) { [1, 7, 3, 4, 7, 8] }
  it 'returns true if no element satisfies the block' do
    expect(array.my_none? { |el| el == 9 }).to eql(true)
  end

  it 'returns false if an element satisfies the block' do
    expect(array.my_none? { |el| el == 7 }).to eql(false)
  end
end

describe '#my_count' do
  let(:array) { [1, 7, 3, 4, 7, 8] }
  it 'returns the correct number of elements' do
    expect(array.my_count { |a| a }).to eql(6)
  end

  it 'does not return an incorrect number of elements' do
    expect(array.my_count { |a| a }).not_to eql(4)
  end
end

describe '#my_map' do
  let(:array) { [1, 7, 3, 4, 7, 8] }
  it 'creates a new array with values returned by the block' do
    expect(array.my_map { |x| x + 1 }).to eql([2, 8, 4, 5, 8, 9])
  end

  it 'creates an empty array' do
    expect(array.my_map { |x| x + 1 }).not_to eql([])
  end
end

describe '#my_inject' do
  let(:array) { [1, 7, 3, 4, 7, 8] }
  it 'returns an accumulated value' do
    expect(array.my_inject(0) do |el, total|
             total + el
           end).to eql(30)
  end
end

describe '#multiply_els' do
  let(:array) { [1, 7, 3, 4, 7, 8] }
  it 'returns a multiplier of all elements in the array' do
    expect(array.multiply_els(array)).to eql(4704)
  end
end
