class SiteYelp
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="biz-page-title embossed-text-white"]'
      image_url 'div[@class="showcase-photo-box"] a img' do |h|
        h.first['src']
      end
      price 'span[@itemprop="priceRange"]'
      location 'li[@class="address"]'

      from {'Yelp'}
    end

  end

end