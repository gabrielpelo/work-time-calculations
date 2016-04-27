def calc(t)
  h1 = t.split(":")[0].to_i
  m1 = t.split(":")[1].to_i
  t1 = h1 * 60 + m1

  t2 = 9 * 60 + 48

  t3 = t1 + t2
  h3 = (t3 / 60).to_i
  m3 = (t3 % 60).to_i

  f(h3) + ":" + f(m3)
end

def f(i)
  i.to_s.rjust(2, "0")
end

def time_to_go(t)
  t1 = Time.now.hour * 60 + Time.now.min

  h2 = t.split(":")[0].to_i
  m2 = t.split(":")[1].to_i
  t2 = h2 * 60 + m2

  t3 = t2 - t1
  h3 = (t3 / 60).to_i
  m3 = (t3 % 60).to_i

  if t3 <= 0
    "0:00"
  elsif t3 < 60
    m3.to_s + "min"
  else
    f(h3) + ":" + f(m3)
  end
end

puts "Bem vindo!"
puts "Este programa deve calcular seu horário de saída."
puts "(digite \"sair\" para encerrar o programa)\n\n"

begin
  print "  Que horas você entrou? \n  > "
  t = gets.chomp

  puts "\n\n"
  if t.gsub(/\D/,'') != ''

    t2 = calc(t)
    t3 = time_to_go(t2)

    puts "    Entrada em " + t + "."
    puts "    Você deve sair às: #{t2}. Faltam #{t3}."
  end
  puts "\n\n"

end until t == "sair"
