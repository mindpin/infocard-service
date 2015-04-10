class SiteSeoParser

  attr_accessor :url, :hostname, :homepage, :title

  def initialize(url)
    @url = url
    @hostname = URI.parse(URI.encode(url)).host
    @homepage = get_homepage(url)
    

    data = eval "Seo.parse(url)"

    @title = data[:title]
  end


  def get_homepage(url)
    domain_parts = @hostname.split('.')
    temp = @hostname.gsub('.com', '').gsub('.cn', '')

    "www.#{temp.split('.').last}.#{domain_parts.last}"
  end


end