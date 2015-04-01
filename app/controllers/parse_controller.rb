class ParseController < ApplicationController

  def index
    
  end


  def create

    parser = SitePageParser.new(params[:url])

    # p parser
    site_page = SitePage.by_url(parser.url)

    unless site_page
      infocard = SitePage.create(
        :url => parser.url,
        :hostname => parser.hostname,
        :homepage => parser.homepage,
        :title => parser.title,
        :image_url => parser.image_url,
        :price => parser.price,
        :location => parser.location,
        :author => parser.author
      )
    end

    p site_page

    # redirect_to "/parse/#{site_page.id}"

    render :nothing => true
  end

  def show
  end


end