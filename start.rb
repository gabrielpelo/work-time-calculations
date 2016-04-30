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

exit_cmds = %w{ sair quit exit leave bye s q e l b }
help_cmds = %w{ ajuda help info options a h i o ? }

puts %{Bem vindo!
Este programa calcula seu horário de saída.}

begin
  print "\n  Que horas você entrou? \n  > "
  t = gets.chomp
  puts "\n"

  if help_cmds.include? t.downcase
    get_help
  elsif t.split.length > 1
    times = []

    t.split.each do |s|
      times.push(Instant.new(s))
    end

    (0..times.length-2).each do |i|
      a = times[i]
      b = times[i+1]
      c = b - a
      puts "    Entrada: #{a}"
      puts "    Saida:   #{b}"
      puts "    Total:   #{c}"
      puts ""
    end
  elsif t.gsub(/\D/,'') != ''
    if t[0] == '-'
      t = t[1..-1]
      a = Instant.new(t.to_s)
      b = Instant.new("9:48")
      c = a - b
      d = a - Instant.now
      puts "    Entrada: #{c}"
      puts "    Saida:   #{a}"
      puts "    Faltam:  #{d}"
    else
      a = Instant.new(t)
      b = Instant.new("9:48")
      c = a + b
      d = c - Instant.now
      puts "    Entrada: #{a}"
      puts "    Saida:   #{c}"
      puts "    Faltam:  #{d}"
    end
  end

end until exit_cmds.include? t.downcase
