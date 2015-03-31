class SiteAmazon
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'span[@id="productTitle"]'
      # image_url 'img[@id="landingImage"]', :text do |h|
      #   h.first['src']
      # end
      price 'span[@id="priceblock_ourprice"]'
    end

  end

end