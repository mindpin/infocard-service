class SitePageParser

  attr_accessor :url, :hostname, :homepage, :image_url, :title, :desc, :price, :location, :author

  def initialize(url)
    @url = url
    url = url.split('#').first
    url = url.gsub('|', '')
    @hostname = URI.parse(url).host
    @homepage = get_homepage(url)
    

    domain = @hostname.gsub('.com', '').gsub('.cn', '')
    name = domain.split('.').last.capitalize
    
    hostname = @hostname.gsub('.', '_')
    # p hostname
    # p "#{Rails.root.to_s}/lib/site_data/site_#{hostname}"
    if File.file?("#{Rails.root.to_s}/lib/site_data/site_#{hostname}.rb")
      name = hostname.split('_').map { |item| item.capitalize }.join
    end
    data = eval "Site#{name}.parse(url)"
    

    p data
    p '===='

    @image_url = data[:image_url]
    @title = data[:title]
    @desc = data[:desc]
    @price = data[:price]
    @location = data[:location]
    @author = data[:author]

  end


  def get_homepage(url)
    domain_parts = @hostname.split('.')
    temp = @hostname.gsub('.com', '').gsub('.cn', '')

    "www.#{temp.split('.').last}.#{domain_parts.last}"
  end

end