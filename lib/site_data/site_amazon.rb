class SiteAmazon
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'span[@id="productTitle"]'
      image_url 'img[@id="landingImage"]' do |h|
        h.first['data-old-hires']
      end
      price 'span[@id="priceblock_ourprice"]'
      from {"亚马逊（中国）"}
    end

  end

end