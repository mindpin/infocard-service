class ApiController < ApplicationController
  before_filter :set_access_control_headers
  def set_access_control_headers
    response.headers['Access-Control-Allow-Origin']   = request.headers["Origin"]
  end

  def fetch_infocard
    site_page = SitePage.parse_url(params[:url])
    render :json => site_page.api_hash
  rescue Exception => e
    puts e.message
    puts e.backtrace
    render :status => 500, :json => {:status => 500}
  end
end