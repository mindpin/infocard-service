class ParseController < ApplicationController

  def index
    
  end


  def create

    parser = InfocardParser.parse(params[:url])

    p parser

    render :nothing => true
  end


end