require './instant.rb'

a = Instant.new("1012")
b = Instant.new("2021")
w = Instant.new("948")

puts a
puts a + 30
puts a + w

puts "\n"

puts b
puts b - 30
puts b - w

puts "\n"

puts a.to_i
puts a

puts "\n"

puts b.to_i
puts b

puts "\n"

times = %w{ 10:12 935 8:30 7.50 0637 1130 11.15 0 24 23:59 }
same_times = %w{ 09:35 09.35 9:35 9.35 935 0935 9 }

(times + same_times).map { |t| Instant.new(t) }.each do |t|
  puts "time: #{t}  time_in_min: #{t.to_i}"
end
