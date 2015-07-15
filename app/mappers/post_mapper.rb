# Provides a mapper between the returned results from the {PostRelation}
# relation, to the {Post} model.
#
# @note This mapper is exposed as "post", and can be
#   utilized as `.as(:post)`.
class PostMapper < ROM::Mapper
  relation :posts

  register_as :post

  model Post
end
