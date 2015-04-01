class SitePageParser

  attr_accessor :url, :hostname, :homepage, :image_url, :title, :desc, :price, :location, :author

  def initialize(url)
    @url = url
    @homepage = get_homepage(url)
    @hostname = URI.parse(url).host

    url = url.gsub(/#.*$/, '')
    domain = URI.parse(url).host
    domain = domain.gsub('.com', '').gsub('.cn', '')
    name = domain.split('.').last.capitalize
    
    data = eval "Site#{name}.parse(url)"

    @image_url = data[:image_url]
    @title = data[:title]
    @desc = data[:desc]
    @price = data[:price]
    @location = data[:location]
    @author = data[:author]

  end


  def get_homepage(url)
    domain = URI.parse(url).host
    domain_parts = domain.split('.')
    temp = domain.gsub('.com', '').gsub('.cn', '')

    "www.#{temp.split('.').last}.#{domain_parts.last}"
  end

end