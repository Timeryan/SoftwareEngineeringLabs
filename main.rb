module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end

      if action == "index" || action == "show"
        routes[verb][action].call
      end

      if verb == "POST" || verb == "PUT" || verb == "DELETE"
        routes[verb].call
      end
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    if @posts.length == 0
      puts 'Нет постов'
    else
      @posts.length.times do |i|
      puts "#{i}: #{@posts[i]}"
      end
    end
  end

  def show
    print 'Ведите индетификатор поста:'
    key = gets.to_i
    if @posts.length >= key
    puts "#{key}: #{@posts[key]}"
    else
    puts('Нет записей с таким ключом')
    end
  end

  def create
    print 'Ведите текс поста:'
    text = gets.chomp
    @posts << (text)
    puts "#{ @posts.index(text)}: #{text}"
  end

  def update
    print 'Ведите индетификатор поста:'
    key = gets.to_i
    if @posts.length >= key
      print 'Ведите новый текс поста:'
      text = gets.chomp
      @posts[key] = text
      puts "#{key}: #{text}"
    else
    puts('Нет записей с таким ключом')
    end
  end

  def destroy
    print 'Ведите индетификатор поста:'
    key = gets.to_i
    if @posts.length >= key
      @posts.delete_at(key)
    else
      puts('Нет записей с таким ключом')
    end
  end
end

class CommentsController
extend Resource

  def initialize
    @comments = []
  end

  def index
    if @comments.length == 0
        puts 'Нет комментариев'
    else
      @comments.length.times do |i|
        puts "#{i}: #{@comments[i]}"
      end
    end
  end

  def show
    print 'Ведите индетификатор комментария:'
    key = gets.to_i
    if @comments.length >= key
      puts "#{key}: #{@comments[key]}"
    else
      puts('Нет комментариев с таким ключом')
    end
  end

  def create
    print 'Ведите текс комментария:'
    text = gets.chomp
    @comments << (text)
    puts "#{ @comments.index(text)}: #{text}"
  end

  def update
    print 'Ведите индетификатор комментария:'
    key = gets.to_i
    if @comments.length >= key
      print 'Ведите новый текс комментария:'
      text = gets.chomp
      @comments[key] = text
      puts "#{key}: #{text}"
    else
      puts('Нет комментариев с таким ключом')
    end
  end

  def destroy
    print 'Ведите индетификатор комментария:'
    key = gets.to_i
    if @comments.length >= key
      @comments.delete_at(key)
    else
      puts('Нет комментариев с таким ключом')
    end
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')
    resources(CommentsController, 'comments')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      CommentsController.connection(@routes['comments']) if choise == '2'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init