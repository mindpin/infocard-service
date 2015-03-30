class ParseController < ApplicationController

  def index
    url = 'http://detail.tmall.com/item.htm?id=15593325475&spm=a1z0k.7385961.1997985097.d4918997.lTDqPh&_u=rkkbfj13db&mt='
    parser = InfocardParser.parse(url)

    p parser[:title].strip

    render :nothing => true
  end


  def create

    # render :nothing => true
  end


end