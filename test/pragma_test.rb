$LOAD_PATH.unshift File.dirname(__FILE__)
require 'helper'

class PragmaTest < Test::Unit::TestCase
  def test_implicit_iterator
    assert_equal <<-text, Pragma.render


* Chris
* Mark
* Scott
text
  end
end
