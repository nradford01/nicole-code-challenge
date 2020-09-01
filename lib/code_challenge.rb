# frozen_string_literal: true

# Trevco Code Challenge
# Fill in the following function to make the test pass
# You can run test with: ruby -Ilib:test test/test_code_challenge.rb


class CodeChallenge
  # Write a function that determines if a string starts with an upper-case letter A-Z.
  def start_with_uppercase_letter?(string)
    string[0] =~ /[A-Z]/
    
  end

  # Write a function that determines the area of a circle given the radius.
  def area_of_circle(radius)
    if radius >= 0
      Math::PI * radius ** 2
    else
      'radius should be positive'
    end
  end

  # Write a function to add up all the values in an array.
  def sum_array(array)
    total = 0
    array.each do |num|
      total += num
    end
    return total
  end

  # Write a function that determines if a string is a palindrome.
  def palindrome?(string)
    string.reverse.casecmp?(string)
  end

  # Write a recursive function to determine the Nth Fibonacci Number in the Fibonacci sequence
  def nth_fibonacci(nth)
    @fibbonaci = @fibbonaci || [0] 
    if nth == 0
      value = @fibbonaci.last
      # clear out @fib value so next test case dosn't start at previous number
      @fibbonaci = nil
      return value
    else
      if @fibbonaci.length < 2 #get the initial sequence setup started
        @fibbonaci << 1
      else
        @fibbonaci << @fibbonaci[-1] + @fibbonaci[-2]
      end
      nth_fibonacci(nth-1)
    end
  

  end

  # Write a function that takes and array of numbers, multiplies each them by their index, and writes it's values to a csv.
  # The csv should have have 3 columns. index, number, and sum.
  def write_array_to_csv(array)
    filename = 'test.csv' # test expects this filename
    #this could be done using CSV.open if the csv module were included. This would remove the need to add the spaces and commas
    File.open('test.csv', 'wb') do |csv|
        csv << "index,number,sum\n"
        array.each_with_index do |value, ind|
          csv << "#{ind},#{value},#{ind * value}\n"
        end
    end
  end
end