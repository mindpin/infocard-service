class SiteFab
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@id="productTitle"]'
      image_url 'ul[@id="productImageSlider"] img' do |h|
        h.first['src']
      end
      price 'span[@itemprop="price"]'
    end

  end

end