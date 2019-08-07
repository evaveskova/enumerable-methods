module Enumerable
def my_each
  i = 0
  while i < self.length
    yield(self[i])
    i += 1
  end
end

def my_each_with_index()
  index = 0
  for i in self
    yield(self[index], index)
    index += 1
  end
end

def my_select
  result = []
  self.my_each do |elem|
    if yield(elem)
      result << elem
    end
  end
  return result
end

def my_all?
  self.my_each {|elem| return false if yield(elem) == false}
  true
end

def my_any?
  self.my_each {|elem| return true if yield(elem)}
  false
end

def my_none?
  self.my_each {|elem| return false if yield(elem)}
  true
end

def my_count
  count = 0
  self.my_each do |elem|
    if yield(elem)
      count += 1
    end
  end
  return count
end

def my_map(&block)
  result = []
  unless block == 0
    self.my_each do |elem|
      result << block.call(elem)
    end
  else
    return result
  end
    return result
end

def my_inject init
    self.my_each {|elem| init = yield(init, elem)}
    init
end

def multiply_els(array)
  result = 1
  for elem in array
    result *= elem
  end
    return result
end

end
