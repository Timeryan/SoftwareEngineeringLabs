def task_1
  file_data = File.read("input.txt").split ("\n")
  loop do
    puts("Введите возраст =>")
    age = gets.chomp
    if age == "-1"
      break
    end
    file_data.length.times do |i|
      if file_data[i].end_with?(age)
        File.write("result.txt", "#{file_data[i]}\n", mode: "a")
      end
    end
    result_data = File.read("result.txt").split("\n")
    file_data.delete_if { |res| result_data.include? res }
    if file_data.length == 0
      break
    end
  end
  file_output_data = File.read("result.txt")
  puts(file_output_data)
end

def deposit(balance, add_sum)
  if add_sum > 0
    puts("Вы внесли на счёт: #{add_sum}$")
    balance += add_sum
    puts("Ваш баланс: #{balance}$")
    balance
  elsif
  puts "Сумма не валидна(меньше нуля)"
  end
end
def withdraw(balance, get_sum)
  if get_sum < 0
    puts "Сумма не валидна(меньше нуля)"
  elsif balance < get_sum
    puts "У вас на счету не сдостаточно средст"
  else
    puts("Вы сняли со счёта: #{get_sum}$")
    balance -= get_sum
    puts("Ваш баланс: #{balance}$")
    balance
  end
end

def get_balance(balance)
    puts("Ваш баланс: #{balance}$")
end

def task_2

  balance = File.file?("balance.txt") ? File.read("balance.txt") : 100.0
  balance = balance.to_f

  loop do
    puts "D - внести деньги\nW - вывести деньги\nB - проверить баланс\nQ - выйти"
    x = gets.chomp
    x = x.upcase
    case x
    when "D"
      puts "Введите сумму для депозита >>"
      add_sum = gets.to_f
      balance = deposit(balance,add_sum)
    when "W"
      puts "Введите сумму для снятия со счета >>"
      get_sum = gets.to_f
      balance = withdraw(balance,get_sum)
    when "B"
      get_balance(balance)
    when "Q"
      File.write("balance.txt", balance)
      return
    else
      puts "Неизвестная команда"
    end
  end
end

def task_3
  loop do
    print "0 - выйти из программы \n1 - первое задание \n2 - второе задание \n>> "
    check = gets.to_i
    if check == 1
      task_1
    elsif check == 2
      task_2
    elsif check == 0
      break
    end
  end
end

task_3
