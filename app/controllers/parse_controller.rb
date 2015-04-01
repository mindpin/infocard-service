class ParseController < ApplicationController

  def index
    
  end


  def create
    site_page = SitePage.by_url(params[:url]).first

    return redirect_to "/parse/#{site_page.id}" if site_page

    begin

      parser = SitePageParser.new(params[:url])

      # p parser
      site_page = SitePage.create(
        :url => parser.url,
        :hostname => parser.hostname,
        :homepage => parser.homepage,
        :title => parser.title,
        :image_url => parser.image_url,
        :price => parser.price,
        :location => parser.location,
        :author => parser.author
      )

      redirect_to "/parse/#{site_page.id}"

    rescue Exception => e
      p e.message
      flash[:error] = '无法解析该地址'
      redirect_to "/parse"
    end

    # render :nothing => true
  end

  def show
    @site_page = SitePage.find(params[:id]) if params[:id]
    

  end


end