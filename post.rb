class Post
  attr_accessor :title
  attr_accessor :author
  attr_accessor :popular

  def initialize(author, popular, title)
    @author = author
    @popular = popular
    @title = title
  end

  def popular?
    @popular
  end
end
