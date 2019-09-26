require 'benchmark'

# Timing code - my benchmark method

def time_method(method, *args)
  beginning_time = Time.now
  self.send(method, args)
  end_time = Time.now
  puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"
end

# Setup - benchmark

array = (1..1000000).map { rand }

# Testing last with benchmark

Benchmark.bmbm do |x|
  x.report("last") { array.dup.last }
end

# Result of last with benchmark

# Rehearsal ----------------------------------------
# last   0.000767   0.001110   0.001877 (  0.002070)
# ------------------------------- total: 0.001877sec

#            user     system      total        real
# last   0.000008   0.000001   0.000009 (  0.000005)

# Testing reverse with benchmark

Benchmark.bmbm do |x|
  x.report("reverse") { array.dup.reverse }
end

# Result of reverse with benchmark

# Rehearsal -------------------------------------------
# reverse   0.004311   0.002882   0.007193 (  0.007230)
# ---------------------------------- total: 0.007193sec

#               user     system      total        real
# reverse   0.001047   0.000012   0.001059 (  0.001067)

# Testing shuffle with benchmark

Benchmark.bmbm do |x|
  x.report("shuffle") { array.dup.shuffle }
end

# Result of shuffle with benchmark

# Rehearsal -------------------------------------------
# shuffle   0.038898   0.002109   0.041007 (  0.041113)
# ---------------------------------- total: 0.041007sec

#               user     system      total        real
# shuffle   0.043117   0.000147   0.043264 (  0.043671)

# Testing sort with benchmark

Benchmark.bmbm do |x|
  x.report("sort") { array.dup.sort }
end

# Result of sort with benchmark

# Rehearsal ----------------------------------------
# sort   0.373528   0.003441   0.376969 (  0.379764)
# ------------------------------- total: 0.376969sec

#            user     system      total        real
# sort   0.376296   0.003244   0.379540 (  0.383854)


# Picking the last element of an array

def last(array)
	array[-1]
end

# puts last([1,2,3])
# puts time_method(:last)
# result = 0.001-3 milliseconds

# Reversing

def reverse(array)
  array.sort_by {|value| -value}
end

# puts reverse([1,2,3])
# puts time_method(:reverse)
# result = 0.002-3 milliseconds

# Shuffling
# add extra line if dealing with non-array objects

def shuffle(array)
  array.sort_by {rand}
end

# puts shuffle([1,2,3])
# puts time_method(:shuffle)
# result = 0.001-6 milliseconds

# Sorting

def sort(array)
	array.sort_by {|value| value}
end

# puts sort([2,1,3])
# puts time_method(:sort)
# result = 0.001-4 milliseconds


