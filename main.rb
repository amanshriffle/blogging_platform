require_relative 'class_post'
require_relative 'class_comment'
require_relative 'class_user'
require_relative 'registeration'
require_relative 'class_main_menu'
require_relative 'login'
require_relative 'list_main.rb'
require 'io/console'

class Main
  extend Registeration
  extend Login
  extend ListMain

  @users = []

  def self.initialize_already_exist_user
    File.readlines('users.txt').each { |line|
      line_arr = line.strip.split('=')
      @users << User.new(line_arr[0],line_arr[1],line_arr[2])
    }
  end
end

catch :exit do
  Main.initialize_already_exist_user
  Main.list_main
end

puts "\n", "Exiting....";
sleep 1
puts "Thank you for visiting Myblog.com", "==" * 30, "\n"
