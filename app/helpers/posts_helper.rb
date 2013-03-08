module PostsHelper
  def join_tags(post)
    post.tags.map { |t| t.name }.join(", ")
  end

  def count_words(post)
    post.content.split(/\s+/).count
  end
end