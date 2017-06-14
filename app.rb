require 'sinatra'

helpers do

  def get_random(view_string)
    nums = []
    balls = 0
    if view_string == "Lotto"
      balls = 6
    elsif view_string == "Powerball"
      balls = 5
    elsif view_string == "Megamillions"
      balls = 6
    end
    #puts "arraysize is #{balls.size}"
    balls.times do
      nums << rand(59)
    end
    return nums
  end

  def get_view(n)
    if n == 1
      return "Lotto"
    elsif n == 2
      puts 'game is Powerball'
      return "Powerball"
    elsif n == 3
      puts 'game is Megamillions'
      return "Megamillions"
    end
  end

end ## end helpers block




get '/' do
  @page_title = 'home'
  erb :index
end

get '/form' do
  @page_title = "form"
  erb :form
end

post '/number' do
  @form_title = "form"
  @number = params[:number].to_i
  if @number == 2
    return "<h2> the number is 2 </h2"
  else
    return "<h2> the number is <strong> not 2</strong>"
  end
end

get '/start' do
  "<h2>in /start </h2>"
end
post '/start' do
  game_mode = params[:game_mode].to_i
  puts "game mode is #{game_mode}"
  view = get_view(game_mode)
  puts "view is #{view}"
  @numbers = get_random(view)
  erb :start
end
