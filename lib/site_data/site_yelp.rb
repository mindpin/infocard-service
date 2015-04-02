class SiteYelp
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="biz-page-title embossed-text-white"]'
      image_url 'div[@class="showcase-photo-box"] a img', :text do |h|
        h.first['src']
      end
      price 'span[@class="business-attribute price-range"]'
      location 'li[@class="address"]'
    end

  end

end