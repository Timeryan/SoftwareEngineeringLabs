
def task_1
    puts("Введите число и слово >>")
    text = gets.chomp
    ar = text.split(" ")
    if ar[1].end_with?("CS")
        puts(ar[0].to_i**ar[1].length)
    else
        puts(ar[1].reverse)
    end
end

def task_2
    puts("Cколько покемонов добавить =>")
    count = gets.to_i
    pokemons = []
    count.times do |i|
        puts("Укажите имя #{i+1} покемона =>")
        name = gets.chomp
        puts("Укажите цвет #{i+1} покемона =>")
        color = gets.chomp
        pokemons<<{"name": name, "color":color}
    end
    puts(pokemons)
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
