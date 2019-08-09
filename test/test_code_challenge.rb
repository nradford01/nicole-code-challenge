require 'minitest/autorun'
require 'code_challenge'

class TestCodeChallenge < MiniTest::Test
  def setup
    @code_challenge = CodeChallenge.new
  end

  def test_determines_if_string_starts_with_an_upper_case_letter
    assert @code_challenge.start_with_uppercase_letter?('Sacramento')
    assert @code_challenge.start_with_uppercase_letter?('MI')
    refute @code_challenge.start_with_uppercase_letter?('detroit')
    refute @code_challenge.start_with_uppercase_letter?('zZzZ')
  end

  def test_area_of_circle_given_radius
    assert_equal 314.1592653589793, @code_challenge.area_of_circle(10)
    assert_equal 18_037.808259118035, @code_challenge.area_of_circle(75.77343)
    assert_equal 'radius should be positive', @code_challenge.area_of_circle(-20)
  end

  def test_sum_array
    assert_equal 2, @code_challenge.sum_array([1, 1])
    assert_equal 1_250_025_000, @code_challenge.sum_array(1..50_000)
  end

  def test_palindrome
    assert @code_challenge.palindrome?('mom')
    assert @code_challenge.palindrome?('Mom')
    refute @code_challenge.palindrome?('california')
  end

  def test_nth_fibonacci
    assert_equal 21, @code_challenge.nth_fibonacci(8)
    assert_equal 0, @code_challenge.nth_fibonacci(0)
    assert_equal 610, @code_challenge.nth_fibonacci(15)
  end

  def test_write_array_to_csv
    @code_challenge.write_array_to_csv(1..5)
    assert_equal "index,number,sum\n0,1,0\n1,2,2\n2,3,6\n3,4,12\n4,5,20\n",
                 File.read('test.csv')
  end
end
