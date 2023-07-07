module Registeration
  def registeration

    puts "\n", "--"* 5 + "Registarion" + "--"* 5,"\n"
    puts "Type 0 and press enter to go back."

    begin
      print "Please enter your username: "
      username = gets.strip.downcase
      return if username == '0'
      raise "\nInvalid username!! enter again- \n\n" if !username.match(/\A[a-z][a-z0-9_]{3,9}\z/)

      File.readlines('users.txt').each {|line|
        line_arr = line.strip.split('=');
        raise "\nUsername already exist! Please use different username\n\n" if line_arr[0]==username
      }

    rescue => e
      puts e
      sleep 1
      retry
    end

    begin
      print "Please enter your email: "
      email = gets.strip.downcase
      return if email == '0'
      raise "\nInvalid E-mail id!! enter again- \n\n" if !email.match(/\A[a-z][\w\d+\-.]+@[\w\d\-]+\.[a-z]{2,3}\z/)

      File.readlines('users.txt').each {|line|
        line_arr = line.strip.split('=');
        raise "\nUser already exist with this email! Please use different Email\n\n" if line_arr[1] == email
      }
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

      return if password == '0'
      raise "\n\nA password must be min 5 and max 10 characters long.\n\n" if !(password.match(/\A.{5,10}\z/))
    rescue => e
      puts e
      sleep 1
      retry
    end

    user_file = File.open('users.txt', 'a')
    user_file.puts "#{username}=#{email}=#{password}"
    user_file.close
    @users << User.new(username,email,password)

    puts "\n\n", "Registration succesful!! Please proceed to login.\n"
    sleep 2
  end
end
