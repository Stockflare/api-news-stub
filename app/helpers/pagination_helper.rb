# Module that enables the API to control paginated requests for resources.
# This module should be used as a mixin whenever a Controller requires
# paginated requests for resources.
#
# @note The #total method should be overloaded, to provide the total number
#   of resources present within the table.
module PaginationHelper
  extend Grape::API::Helpers

  params :pagination do
    optional :page, type: Integer, default: 1, desc: 'Page to retrieve'
    optional :per_page, type: Integer, default: 30, desc: 'Number of results per page'
  end

  # Presents an array-based response and constructs a JSON object that is
  # passed through in the X-Pagination header within the response.
  #
  # @note This header contains all of the necessary links as defined within
  #   the RFC specification.
  def paginate(resp)
    present resp
    header 'X-Pagination', {
      next: params[:page] + 1,
      previous: params[:page] - 1,
      current: params[:page],
      per_page: params[:per_page],
      count: resp.to_a.count,
      total: total,
      pages: (total / [total, params[:per_page]].min).ceil
    }.to_json
  end

  # This method should return the total number of resources for the defined
  # scope.
  #
  # @note This method should be overloaded within the Controller.
  #
  # @return [fixnum] the total number of records present for the resource.
  def total
    -1
  end
end
