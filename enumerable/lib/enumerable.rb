module Enumerable

  def my_select
    arr = self.to_a
    arr_return = []
    i = 0
    if block_given?
      while i < self.size
        if yield(arr[i])
          arr_return << arr[i]
        end
        i += 1
      end
      arr_return
    else
      return self
    end
  end

  def my_all?
    arr = self.to_a
    i = 0
    while i < self.size
      # with block
      return false if block_given? && yield(arr[i]) == false
      # no block
      return false if arr[i].nil? || arr[i] == false
      i += 1
    end
    true
  end

  def my_any?
    arr = self.to_a
    i = 0
    while i < self.size
      # with block
      if block_given?
        return true if yield(arr[i]) == true
      # no block
      elsif arr[i] != nil && arr[i] != false
        return true
      end
      i += 1
    end
    false
  end

  def my_none?
    arr = self.to_a
    true_counter = 0
    i = 0
    while i < self.size
      break if true_counter > 0
      if block_given?
        if yield(arr[i]) == true
          true_counter += 1
        end
      elsif arr[i] != nil && arr[i] != false
        true_counter += 1
      end
      i += 1
    end
    true_counter == 0 ? true : false
  end

  def my_count(item = nil)
    arr = self.to_a
    counter = 0
    i = 0
    return self.size if item.nil? && block_given? == false
    while i < self.size
      if block_given?
        counter += 1 if yield(arr[i]) == true
      else
        counter += 1 if arr[i] == item
      end
      i += 1
    end
    counter
  end

  def my_map(proc = nil)
    arr = self.to_a
    new_arr = []
    i = 0
    while i < self.size
      if block_given?
        new_arr << yield(arr[i])
      elsif proc != nil
        new_arr << proc.call(arr[i])
      else
        return self
      end
      i += 1
    end
    new_arr
  end
end
 
=begin
## Test Suite From Ruby 2.3.4 Docs @ http://ruby-doc.org/ ##

#SELECT
(1..10).my_select { |i|  i % 3 == 0 }           #=> [3, 6, 9]
[1,2,3,4,5].my_select { |num|  num.even?  }     #=> [2, 4]

#ALL?
%w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
%w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
[nil, true, 99].my_all?                              #=> false

#ANY?
%w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
%w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
[nil, true, 99].my_any?                              #=> true

#NONE?
%w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
%w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
[].my_none?                                           #=> true
[nil].my_none?                                        #=> true
[nil, false].my_none?                                 #=> true
[nil, false, true].my_none?                           #=> false


#COUNT
ary = [1, 2, 4, 2]
ary.my_count                    #=> 4
ary.my_count(2)                 #=> 2
ary.my_count{ |x| x%2==0 }      #=> 3

#MAP
(1..4).my_map { |i| i*i }       #=> [1, 4, 9, 16]
(1..4).my_map { "cat"  }        #=> ["cat", "cat", "cat", "cat"]
=end