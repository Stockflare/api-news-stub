# Provider of HTTP Tag-related Endpoints for the Posts Stub API.
class TagController < Grape::API
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
    requires :tag, type: String
  end
  route_param :tag do
    params do
      use :pagination
    end
    get do
      prefix = (params[:page] - 1) * params[:per_page]
      suffix = prefix + params[:per_page]
      tags = orm.relation(:posts).as(:post).by_tag(params[:tag]).to_a[prefix...suffix]
      if tags.to_a.count > 0
        paginate tags
      else
        error! 'Not Found', 404
      end
    end
  end

end
