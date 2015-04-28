class ParseController < ApplicationController
  before_filter :pre_load

  def pre_load
    file = Rails.root.to_s + "/config/sites.yml"
    @data = YAML.load(File.open(file))
  end

  def index
    
    
  end

  def create
    site_page = SitePage.parse_url(params[:url].strip)
    if site_page.title.nil?
      flash[:error] = '无法解析'
    end
    redirect_to "/parse/#{site_page.id}"
  rescue Exception => e
    flash[:error] = e.message
    redirect_to "/parse"
  end

  def show
    @site_page = SitePage.find(params[:id]) if params[:id]

    @intro = '获取基本信息'
    @data.each_with_index do |item, index|
      @intro = item['intro'] if item['url'] == @site_page.url
    end

  end


  def destroy
    site_page = SitePage.find(params[:id])
    p site_page

    if site_page
      site_page.destroy
    end

    redirect_to "/parse"
  end


end