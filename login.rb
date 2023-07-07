module Login
  def login

    puts "\n", "--"* 5 + " Login " + "--"* 5,"\n"
    puts "Type 0 and press enter to go back."

    begin
      print "Please enter your username/e-mail: "
      username_email = gets.strip.downcase
      return [false] if username_email == '0'
      raise "\n\nUsername/e-mail should not be empty! enter again-\n\n" if username_email.empty?
    rescue => e
      puts e
      sleep 1
      retry
    end

    begin
      print "Please enter your password: "
      password = ''

      while char = STDIN.getch
        break if char == "\r"
        if char == "\u007F"
          if !password.empty?
            print "\b \b"
            password.chop!
          end
        else
          print char
          sleep 0.10
          print "\b"
          print "*"
          password += char
        end
      end

      return [false] if password == '0'

      raise "\n\nPassword should not be empty! enter again-\n\n" if password.empty?
    rescue => e
      puts e
      sleep 1
      retry
    end

    if File.readlines('users.txt').any? { |line|
      line_arr = line.strip.split('=')
      (line_arr[0] == username_email || line_arr[1]==username_email) && line_arr[2] == password
     }

      puts "\n\n Login successful! \n";
      sleep 1
      logged_user = @users.find {|user| user.username == username_email || user.email == username_email}
      return true, MainMenu.new(@users,logged_user)
    else
      puts "\n\n", "Please enter valid username or password"
      puts "if you have not registered before, please register first!", "\n"
      sleep 1
      return [false]
    end
  end
end
