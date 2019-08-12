require_relative '../lib/enumerable_methods'
describe '::Enumerables' do
  let(:array) { [1,7,3,4,7] }

  describe '#my_each' do

    it 'returns the array' do
      expect do
        array.my_each {|a| print a}
      end.to output("17347").to_stdout
    end

    it 'returns an empty array' do
      array = []
      expect do
        array.my_each {|a| print a}
      end.to output("").to_stdout
    end
  end

  describe '#my_each_with_index' do
    it "returns elements and their index" do
      expect do
        array.my_each_with_index {|el, index = 0| puts "#{el} is in position #{index}"}
      end.to output("1 is in position 0\n7 is in position 1\n3 is in position 2\n4 is in position 3\n7 is in position 4\n").to_stdout
    end
  end

  it "does not return elements and their index" do
    expect do
      array.my_each_with_index {|el, index = 0| puts "#{el} is in position #{index}"}
    end.to output("").to_stdout
  end

  describe '#my_select' do
    let(:array) { [1,7,3,4,7] }
      it 'returns value which are less than 7' do
        expect(array.my_select {|a| a < 7}.to eql([1, 3, 4]))
      end

      it "returns values which are greater than 6"
        expect(array.my_select {|a| a < 7}.not_to eql([7, 7]))
      end
    end
