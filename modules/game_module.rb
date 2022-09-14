require_relative '../classes/game'

module GamesModule
  def add_game
    puts 'Enter Published date (YYYY-MM-DD): '
    publish_date = gets.chomp
    valid_date(publish_date)

    puts 'Multiplayer? (y/n)'
    multiplayer = gets.chomp
    case multiplayer
    when 'y'
      multiplayer = true
    when 'n'
      multiplayer = false
    end

    puts 'Enter last played date (YYYY-MM-DD):'
    last_played_at = gets.chomp
    valid_last_played(last_played_at)

    game = Game.new(publish_date, multiplayer, last_played_at)
    @games.push(game)
    puts 'Game added Successfully!'
  end

  def list_games
    puts
    @games.each_with_index do |game, index|
      puts "#{index}) Published date: '#{game.publish_date}', Multiplayer: #{game.multiplayer}, Last played at: '#{game.last_played_at}'"
    end
  end
end
