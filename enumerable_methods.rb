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

def my_map(*procs)
  result = []
  if procs.count == 0
    self.my_each {|elem| result << yield(elem)}

  else
    proc = procs[0]
    self.my_each(&proc)

    return result
  end
end

def my_inject(*init)
  result = 0
  if init.count == 0
    self.my_each {|elem| init - yield(init, elem)}

    return init
  end
end

def multiply_els(array)
  result = 1
  for elem in array
    result *= elem
  end
    return result
  end

end
