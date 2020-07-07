require_relative 'blog'

class User
  attr_accessor :blog

  def initialize(posts)
    @blog = Blog.new(posts)
  end
end
