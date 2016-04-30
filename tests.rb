require './work_time_calc'

times = %w{ 10:12 935 8:30 7.50 0637 1130 11.15 0 24 23:59 }
same_times = %w{ 09:35 09.35 9:35 9.35 935 0935 9 }


#(times + same_times).each do |t|
#  print "time: " + t.to_s.ljust(8,' ')
#  print "time_in_min: " + to_minute(t).to_s.ljust(8,' ')
#  print "formatted: " + to_hour(to_minute(t)).ljust(8,' ')
#  print "\n"
#end

a = Instant.new(1012)
b = Instant.new(2021)
w = Instant.new(948)


puts "\n"
puts a
puts a + 30
puts a + w.to_i

puts "\n"
puts b
puts b - 30
puts b - w.to_i

puts "\n"
puts a.to_i
puts a.to_s

puts "\n"
puts b.to_i
puts b.to_s

