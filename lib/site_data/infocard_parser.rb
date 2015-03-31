class InfocardParser

  attr_accessor :url, :hostname, :homepage, :image_url, :title, :desc, :price, :location

  def self.parse(url)
    url = url.gsub(/#.*$/, '')
    domain = URI.parse(url).host
    domain = domain.gsub('.com', '').gsub('.cn', '')
    name = domain.split('.').last.capitalize
    
    eval "Site#{name}.parse(url)"

  end

end