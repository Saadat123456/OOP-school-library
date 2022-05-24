require_relative '../student'
require_relative '../teacher'
require_relative '../book'
require_relative '../rental'
require_relative './modules/messages'
require_relative './controllers/app_controller'

class App
  def run(app_controller = AppController.new)
    @option = 0
    @app_controller = app_controller
    show_menu
  end

  include Messages

  def show_menu
    welcome_message
    while @option != 7
      show_options
      @option = gets.chomp.to_i
      @app_controller.run_user_command @option if @option != 7
    end
  end
end
