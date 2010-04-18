#!/usr/bin/env ruby 

require './solver'

# Array of puzzles
# [Start State, End State]
PUZZLES = [
  ['ddbcb_dadabd', 'db_cddbabdad'],
  ['dabcd_bbddda', 'ab_bddcbddda'],
  ['ddcddba_babd', 'dddcb_adabbd'],
  ['dbababcddd_d', 'badbdadddc_b'],
  ['cdddaba_dbdb', 'ca_baddddbdb'],
  ['_abddddcadbb', 'db_ddadcabdb'],
  ['ddaadddbbc_b', 'ddbdddbabc_a'],
  ['ad_addbbbddc', 'adabbbc_dddd']]

PUZZLES.each do |puzzle|
  solver = Solver.new(true)
  puts solver.format(solver.iterative_deepening(puzzle[0], puzzle[1]))
end
