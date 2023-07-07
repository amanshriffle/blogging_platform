module ListMain
  def list_main
    while true do
      puts "\n","--" * 30
      puts "Welcome to Myblog.com"
      puts "1. Register an account"
      puts "2. Login"
      puts "3. Exit"
      print "Please choose an option: "

      input = gets.strip

      unless input.match(/\A[1-3]\z/)
        puts "\nInvalid option, please choose again\n"
        sleep 1
        redo
      end

      case input.to_i
      when 1
        Main.registeration
      when 2
        main_login = Main.login
        main_login[1].show_main_menu if main_login[0]
      when 3
        throw :exit
      else

      end
    end
  end
end
