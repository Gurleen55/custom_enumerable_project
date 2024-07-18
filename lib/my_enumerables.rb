module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for elem in self
      yield(elem, index)
      index += 1
    end
  end

  def my_select
    my_array = []
    for elem in self 
      if yield(elem)
        my_array << elem
      end
    end
    my_array
  end

  def my_all?
    for elem in self
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    for elem in self
      return true if yield(elem)
    end
    false
  end

  def my_none?
    for elem in self
      return false if yield(elem)
    end
    true
  end

  def my_count(x = "no argument")
    counter = 0
    if block_given?
      for elem in self 
        if yield(elem)
          counter += 1
        end
      end
    elsif x == "no argument"
      return self.size
    else
      for elem in self
        if elem == x
          counter += 1
        end
      end
    end
    counter
  end

  def my_map
    my_array = []
    for elem in self 
      mapped_element = yield(elem)
      my_array << mapped_element
    end
    my_array
  end

  def my_inject(x = "no argument")
    acc = x == "no argument" ? self[0] : x
    for elem in self
      acc = yield(acc, elem)
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self
      yield(elem)
    end
  end
end
