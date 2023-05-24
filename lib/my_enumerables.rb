module Enumerable
  # Your code goes here
  def my_each_with_index
    count = 0
    for element in self do
      yield element, count
      count += 1
    end
  end

  def my_select
    selected_array = []
    for element in self do
      selected_array.push(element) if yield element
    end
    selected_array
  end

  def my_all?
    for element in self do
      return false unless yield element
    end

    true
  end

  def my_any?
    for element in self do
      return true if yield element
    end

    false
  end

  def my_none?
    for element in self do
      return false if yield element
    end

    true
  end

  def my_count
    return count unless block_given?

    matches = 0
    for element in self do
      matches += 1 if yield element
    end

    matches
  end

  def my_map
    new_array = []

    for element in self do
      new_array.push(yield element)
    end

    new_array
  end

  def my_inject(initial_value)
    current_value = initial_value

    for element in self do
      current_value = yield current_value, element
    end

    current_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self do
      yield element
    end
    self
  end
end
