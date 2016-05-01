require_relative 'instant'

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

puts "\n"

a = Instant.new("2033")
b = Instant.new("2034")
c = Instant.new("2033")
d = Instant.new("2133")

x = %w{ 2033 2034 2033 2133}
x.map! { |t| Instant.new(t) }

puts x

puts "\n"

puts x.map { |t| t.to_i }

puts "\n"

(2..x.length).each do |i|
  a = x[i-2]
  b = x[i-1]
  c = b - a

  puts "#{b} - #{a} = #{c}"
  puts "#{b.to_i} - #{a.to_i} = #{c.to_i}"
  puts "\n"

end
