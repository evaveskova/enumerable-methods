def my_each
  i = 0
  while i < self.length
    yield(self[i])
    i += 1
  end
end

def my_each_with_index()
  index = 0
  for elem in self
    yield(self[index])
    i += 1
  end
end

def my_select
  arr = Array.new[]
  self.my_each {|elem| new_arr << elem if yield(elem)}
  arr
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
end
