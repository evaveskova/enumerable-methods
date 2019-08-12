
describe '#my_each' do
  let(:array) { [1,7,3,4,7] }
  it 'returns the array' do
    expect do
      array.my_each {|a| print a}
    end.to output("17347").to_stdout
  end

it 'returns an empty array' do
  expect do
    array.my_each {|a| print a}
  end.to output("").to_stdout
end

end
