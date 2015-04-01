class ParseController < ApplicationController

  def index
    
  end


  def create

    parser = InfocardParser.new(params[:url])

    p parser

    # Infocard.create(
    #   :url => parser.url,
    #   :hostname => parser.hostname,
    #   :homepage => parser.homepage,
    #   :title => parser.title,
    #   :image_url => parser.image_url,
    #   :price => parser.price,
    #   :location => parser.location,
    #   :author => parser.author,
    # )

    render :nothing => true
  end

  def show
  end


end