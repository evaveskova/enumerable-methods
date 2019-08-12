require_relative '../lib/enumerable_methods'
describe '::Enumerables' do
  let(:array) { [1,7,3,4,7,8] }

  describe '#my_each' do

    it 'returns the array' do
      expect do
        array.my_each {|a| print a}
      end.to output("173478").to_stdout
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
      end.to output("1 is in position 0\n7 is in position 1\n3 is in position 2\n4 is in position 3\n7 is in position 4\n8 is in position 5\n").to_stdout
    end
  end


  describe '#my_select' do
      it 'returns value which are less than 7' do
        expect(array.my_select {|a| a < 7}).to eql([1, 3, 4])
      end

      it "doesn't return values less than 7" do
        expect(array.my_select {|a| a > 7}).to eql([8])
      end
  end

  describe "#my_any?" do
    it 'returns true if any element is even' do
      expect(array.my_any? {|el| el % 2 == 0}).to eql(true)
    end

    it 'returns false if no element is greater than 8' do
      expect(array.my_any? {|el| el > 8}).to eql(false) 
    end
  end

end