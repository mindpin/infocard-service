class InfocardParser

  attr_accessor :url, :hostname, :homepage, :image_url, :title, :desc, :price, :location

  def self.parse(url)
    # @hostname = request.url
    
    SiteTmall.parse(url)

  end

end