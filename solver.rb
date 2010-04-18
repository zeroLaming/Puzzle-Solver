class Solver
  
  # Define valid moves (p = plus, m = minus)
  # Example:
  # If the space is at 0, characters 1 and 4 (right and below)
  # can be swapped with it.
  MOVES = {
    0 =>  {:p  => [1, 4], :m => []},
    1 =>  {:p  => [1, 4], :m => [1]},
    2 =>  {:p  => [1, 4], :m => [1]},
    3 =>  {:p  => [4],    :m => [1]},
    4 =>  {:p  => [1, 4], :m => [4]},
    5 =>  {:p  => [1, 4], :m => [1, 4]},
    6 =>  {:p  => [1, 4], :m => [1, 4]},
    7 =>  {:p  => [4],    :m => [1, 4]},
    8 =>  {:p  => [1],    :m => [4]},
    9 =>  {:p  => [1],    :m => [1, 4]},
    10 => {:p  => [1],    :m => [1, 4]},
    11 => {:p  => [],     :m => [1, 4]}}
    
  def initialize(quiet = false)
    @quiet = quiet
  end
  
  def next_config(config)
    i = 0
    result = Array.new
    config.freeze.each_char do |c|
      if c.eql? '_'
        MOVES[i][:p].each{|m| result.push swap_char(config, i, i + m)}
        MOVES[i][:m].each{|m| result.push swap_char(config, i, i - m)}
      end
      i += 1
    end
    result
  end

  def swap_char(str, start_char, end_char)
    temp = String.new str
    swap = temp[start_char]
    temp[start_char] = temp[end_char]
    temp[end_char] = swap
    return temp
  end
  
  def depth_first(config, dest, depth)
    return nil if depth == 0    
    return Array.new.push config if config.eql? dest
    next_config(config).each do |res|
      route = depth_first(res, dest, depth - 1)
      if route != nil
        route.unshift(config)
        return route 
      end
    end
    nil
  end
  
  def iterative_deepening(config, dest)
    depth = 1
    while true
      puts "Depth: " + depth.to_s if !@quiet 
      route = depth_first(config, dest, depth) 
      return route if route != nil
      depth += 1
    end
  end
  
  def format(routes)
    return "No Route found" if routes == nil
    output = ''
    (1..3).each do |n|
      line = ''
      routes.each do |route|
        f = ''
        f = route[0..3]  if n == 1
        f = route[4..7]  if n == 2
        f = route[8..11] if n == 3
        line = line + f + ' '
      end
      output = output + line.strip + "\n"
    end
    "\n" + output + "\n"
  end
  
end