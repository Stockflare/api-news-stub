# Provider of HTTP Endpoints for the Posts Stub API. Currently
# only supports GET requests as the API loads its data from
# a CSV file.
class PostController < Grape::API
  # @!parse include OrmHelper
  helpers OrmHelper

  # @!parse include PaginationHelper
  helpers PaginationHelper

  helpers do
    def total
      orm.relations.posts.to_a.count
    end
  end

  format :json
  params do
    use :pagination
  end
  get do
    prefix = (params[:page] - 1) * params[:per_page]
    suffix = prefix + params[:per_page]
    posts = orm.relation(:posts).as(:post).to_a[prefix...suffix]
    if posts.to_a.count > 0
      paginate posts
    else
      error! 'Not Found', 404
    end
  end

  params do
    requires :id, type: Integer
  end
  route_param :id do
    get do
      begin
        present orm.relation(:posts).as(:post).by_id(params[:id]).one!
      rescue
        error! :not_found, 404
      end
    end
  end

end
