class Post
  attr_accessor :url, :title, :content, :author, :tags, :publication_date
  attr_reader :comments, :like_by

  def initialize(url, title, content, author, tags)
    @url = url
    @title = title
    @content = content
    @author = author
    @tags = tags
    @publication_date = Time.now.to_s.slice(0,19)
    @like_by = []
    @comments = []
  end

  def display_post
    puts "Title: #{@title}"
    puts "Author: #{@author}"
    puts "Content: #{@content}"
    puts "Published on: #{@publication_date}"
  end

  def add_like_by(username)
    @like_by << username
  end

  def add_comment(comment)
    @comments << comment
  end
end
