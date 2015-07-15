# Parse a {Post} object and expose it as a mapped Entity within
# the API.
class PostEntity < Grape::Entity

  expose :id, :title, :url, :guid, :excerpt, :tags

  format_with(:epoch_time) { |dt| dt.to_i }

  with_options(format_with: :epoch_time) do
    expose :created
  end

  expose :source do
    expose :source_permalink, as: :permalink
  end

  expose :karma do
    expose :votes
    expose :score
  end

end
