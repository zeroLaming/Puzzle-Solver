#!/usr/bin/env ruby 
require 'test/unit'
require '../solver'

class PuzzleTest < Test::Unit::TestCase
  def setup
  end
  
  def test_char_swap
    assert_equal('ehllo', Solver.new().swap_char('hello', 0, 1), "Swapping Chars works")
    assert_not_equal('hello', Solver.new().swap_char('hello', 0, 1))
  end
  
end
