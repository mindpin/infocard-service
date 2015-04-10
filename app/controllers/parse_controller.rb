class ParseController < ApplicationController
  before_filter :pre_load

  def pre_load
    file = Rails.root.to_s + "/config/sites.yml"
    @data = YAML.load(File.open(file))
  end

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