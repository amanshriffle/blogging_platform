module SearchPost
  def search_post
    begin
      puts "--" * 30
      puts "1. Search by title or content"
      puts "2. Search by tags"
      puts "3. Go back to main menu"
      print "Please enter your choice: "
      search_choice = gets.strip

      raise "\nPlease enter valid option\n\n" unless search_choice.match(/\A[1-3]\z/)

      case search_choice.to_i
        when 1
          search_by_title
          raise ""
        when 2
          search_by_tags
          raise ""
        when 3
          return
      end

    rescue => e
      puts e
      retry
    end
  end
end
