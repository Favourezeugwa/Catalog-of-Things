require_relative 'app'

class Main
  def initialize
    @app = App.new
    @app.menu_options
  end
end

main = Main.new
main