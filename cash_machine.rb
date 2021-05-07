require 'socket'

class CashMachine
  attr_reader :balance

  def initialize(balance)
    @balance = balance;
  end

  def deposit(connection, add_sum)
    if add_sum > 0
      connection.print "You add to your balance: #{add_sum}$</br>"
      @balance += add_sum
      connection.print "Your balance: #{@balance}$"
    elsif connection.print "Sum is invalid"
    end
  end

  def withdraw(connection, get_sum)
    if get_sum < 0
      connection.print "Sum is invalid"
    elsif balance < get_sum
      connection.print "You don't have enough money in your account"
    else
      connection.print("You withdrawn from your balance: #{get_sum}$</br>")
      @balance -= get_sum
      connection.print "Your balance: #{@balance}$"
    end
  end

  def get_balance(connection)
    connection.print "Your balance: #{@balance}$"
  end

  def self.init
    balance = File.file?("balance.txt") ? File.read("balance.txt") : 100.0
    bank_account = CashMachine.new(balance.to_f)

    server = TCPServer.new('0.0.0.0', 3000)

    while (connection = server.accept)
      request = connection.gets
      method, full_path = request.split(' ')
      path, param = full_path.split('?')

      connection.print "HTTP/1.1 200\r\n"
      connection.print "Content-Type: text/html\r\n"
      connection.print "\r\n"

      case path
      when "/"
        connection.print "/deposit?50 - add to your balance 50$</br>/withdrawn?50 - withdrawn from your balance 50$</br>/balance - check your balance</br>/exit - exit"
      when "/deposit"
        bank_account.deposit(connection, param.to_i)
      when "/withdraw"
        bank_account.withdraw(connection, param.to_i)
      when "/balance"
        bank_account.get_balance(connection)
      when "/exit"
        File.write("balance.txt", balance)
        return
      else
        connection.print "Unbalanced request:" + "\nMethod: " + method + "Path: " + path
      end
    end
  end
end

CashMachine.init

