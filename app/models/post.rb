# This class acts as a model for all posts that are represented
# by this API. It includes an extended Entity class, so that Grape
# may automatically present instances as the correct entities.
class Post
  include ValueObject, OrmHelper

  # "id","title","url","guid","source_permalink","votes","score"

  values do
    attribute :id, Integer
    attribute :title, String
    attribute :url, String
    attribute :excerpt, String
    attribute :tags, String
    attribute :guid, String
    attribute :source_permalink, String
    attribute :votes, Integer
    attribute :score, Integer
  end

  def tags
    super.split(/,/)
  end

  def created
    now = Time.now.utc
    rand = 3 + Random.rand(9)
    now - 60 * 60 * rand
  end

  # This nested class is used by Grape to automatically expose instances
  # of the {Post} class as entities within the API.
  class Entity < PostEntity
  end
end
