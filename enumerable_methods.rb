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
