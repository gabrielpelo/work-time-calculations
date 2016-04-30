require './instant.rb'

def get_help
  puts %{
    ***************************************************

    Bem vindo!
    Este programa calcula seu horário de saída.

    Voce pode entrar com os horarios desejados nos
    seguintes formatos:
      - hh
      - hh:mm
      - hh.mm
      - hhmm

    Voce tambem pode passar o tempo de saida para
    calcularmos a data de entrada, basta entrar com o
    horario de saida com o sinal de "-" na frente.
    Exemplo:
      > -20:00

    Para calcular o tempo entre dois horarios basta
    informar os dois horarios na mesma linha separados
    por espaco.
    Exemplo:
      > 9:58 19:33

    Se precisar de ajuda, digite "ajuda" para exibir
    esta mensagem.

    Quando terminar, digite "sair" para encerrar o
    programa.

    ***************************************************
       }
end

def calculate_multiple_values(t)
  times = t.split.map { |s| Instant.new(s) }

  (2..times.length).each do |i|
    a = times[i-2]
    b = times[i-1]
    c = b - a
    print_multiple_results(a, b, c)
    puts ""
  end
end

def calculate_entrance_time(t)
  a = Instant.new(t)
  b = Instant.new("9:48")
  c = a - b
  d = a - Instant.now
  print_result(c, a, d)
end

def calculate_exit_time(t)
  a = Instant.new(t)
  b = Instant.new("9:48")
  c = a + b
  d = c - Instant.now
  print_result(a, c, d)
end

def print_result(a, b, c)
  puts "    Entrada: #{a}"
  puts "    Saida:   #{b}"
  puts "    Faltam:  #{c}"
end

def print_multiple_results(a, b, c)
  puts "    Entrada: #{a}"
  puts "    Saida:   #{b}"
  puts "    Total:   #{c}"
end

def exit_cmds
  %w{ sair quit exit leave bye s q e l b }
end

def help_cmds
  %w{ ajuda help info options a h i o ? }
end

def has_multiple_values?(t)
  t.split.length > 1
end

def is_calling_help?(t)
  help_cmds.include? t.downcase
end

def is_done?(t)
  exit_cmds.include? t.downcase
end

def has_a_number?(t)
  t.gsub(/\D/,'').length > 0
end

def should_calculate_entrance?(t)
  t[0] == '-'
end

puts "Bem vindo!\nEste programa calcula seu horário de saída."

begin
  print "\n  Que horas você entrou? \n  > "
  t = gets.chomp
  puts "\n"

  if is_calling_help? t
    get_help
  elsif has_multiple_values? t
    calculate_multiple_values t
  elsif has_a_number? t
    if should_calculate_entrance? t
      calculate_entrance_time t[1..-1]
    else
      calculate_exit_time t
    end
  end
end until is_done? t
