# This class defines all the relations within the Post API and organises
# how the data is accessed. It identifies itself as :posts and can be
# accessed using #ROM.env as `relation(:posts)`.
class PostRelation < ROM::Relation[Application::ORM]
  dataset :posts

  # Retrieve a specific Post by using the code that has been
  # provided.
  #
  # @note If the ID provided does not match any Posts, an empty
  #   collection will be returned.
  #
  # @param [integer] id to retrieve a specific post by
  #
  # @return [array] collection of a single post.
  def by_id(id)
    restrict(id: id)
  end

  def by_tag(tag)
    restrict { |post| post[:tags].match tag }
  end
end
