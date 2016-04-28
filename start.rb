require './work_time_calc'

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

  if help_cmds.include? t.downcase
    get_help
  elsif t.gsub(/\D/,'') != ''
    if t[0] == '-'
      t = t.gsub(/\-/,'')

      a = to_hour(to_minute(t))
      b = calc_reverse(t)

      puts "\n"
      puts "    Saida em #{a}."
      puts "    Entrada às #{b}."
    else
      a = to_hour(to_minute(t))
      b = calc(t)
      c = time_to_go(b)

      puts "\n"
      puts "    Entrada em #{a}."
      puts "    Você deve sair às #{b}. Faltam #{c}."
    end
  else
    puts "\n"
  end

end until exit_cmds.include? t.downcase
