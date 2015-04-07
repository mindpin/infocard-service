class SitePageParser

  attr_accessor :url, :hostname, :homepage, :image_url, :title, :desc, :price, :location, :author

  def initialize(url)
    @url = url
    # url = url.split('#').first
    # url = url.gsub('|', '')
    @hostname = URI.parse(URI.encode(url)).host
    @homepage = get_homepage(url)
    

    data = eval "Site#{get_name}.parse(url)"
    

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


  def get_name
    return get_name_from_itunes if @hostname == 'itunes.apple.com'
    return get_name_from_vipship if @hostname == 'archive-shop.vip.com'


    hostname = @hostname.gsub('.', '_')
    if File.file?("#{Rails.root.to_s}/lib/site_data/site_#{hostname}.rb")
       return hostname.split('_').map { |item| item.capitalize }.join
    end

    @hostname.gsub('.com', '').gsub('.cn', '').split('.').last.capitalize
  end


  def get_name_from_itunes
    hostname = @hostname.split('.').map { |item| item.capitalize }.join

    return hostname + "Book" if @url.include? '/book/'
    return hostname + "Podcast" if @url.include? '/podcast/'

    hostname + "Appstore"
  end


  def get_name_from_vipship
    'VipShop'
  end

end