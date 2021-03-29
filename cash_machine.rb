class CashMachine
  attr_reader :balance
  def initialize(balance)
    @balance = balance;
  end

  def deposit(add_sum)
    if add_sum > 0
      puts("Вы внесли на счёт: #{add_sum}$")
      @balance += add_sum
      puts("Ваш баланс: #{@balance}$")
    elsif
    puts "Сумма не валидна(меньше нуля)"
    end
  end

  def withdraw( get_sum)
    if get_sum < 0
      puts "Сумма не валидна(меньше нуля)"
    elsif balance < get_sum
      puts "У вас на счету не сдостаточно средст"
    else
      puts("Вы сняли со счёта: #{get_sum}$")
      @balance -= get_sum
      puts("Ваш баланс: #{@balance}$")
    end
  end

  def get_balance
    puts("Ваш баланс: #{@balance}$")
  end

  def self.init
    balance = File.file?("balance.txt") ? File.read("balance.txt") : 100.0
    bank_account = CashMachine.new(balance.to_f)

    loop do
      puts "D - внести деньги\nW - вывести деньги\nB - проверить баланс\nQ - выйти"
      x = gets.chomp
      x = x.upcase
      case x
      when "D"
        puts "Введите сумму для депозита >>"
        add_sum = gets.to_f
        bank_account.deposit(add_sum)
      when "W"
        puts "Введите сумму для снятия со счета >>"
        get_sum = gets.to_f
        bank_account.withdraw(get_sum)
      when "B"
        bank_account.get_balance
      when "Q"
        File.write("balance.txt", balance)
        return
      else
        puts "Неизвестная команда"
      end
    end
  end
end

CashMachine.init

