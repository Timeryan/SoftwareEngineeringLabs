
def task_1()
puts 'Введите имя:'
user_fname = gets.chomp
puts 'Введите фамилию:'
user_lname = gets.chomp
puts 'Введите возвраст:'
user_age = gets.to_i

if user_age < 18
    puts "Привет #{user_fname} #{user_lname}, тебе меньше 18 лет, но начать учиться програмированию никогда не рано"
else
    puts "Привет #{user_fname} #{user_lname} самое время заняться делом"
end
end

def task_2()

puts 'Введите первое число:'
a = gets.to_i

puts 'Введите второе число:'
b = gets.to_i

if a ==20
    puts "#{a}"
elsif b == 20
    puts "#{b}" 
else
    puts a+b
end
end

def task_3
    check = 1
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
