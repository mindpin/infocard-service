class ParseController < ApplicationController

  def index
    
  end

  def create
    site_page = SitePage.parse_url(params[:url])
    redirect_to "/parse/#{site_page.id}"
  rescue Exception => e
    flash[:error] = e.message
    redirect_to "/parse"
  end

  def show
    @site_page = SitePage.find(params[:id]) if params[:id]
    

  end


end