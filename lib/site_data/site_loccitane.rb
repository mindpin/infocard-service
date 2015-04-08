class SiteLoccitane
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@id="product_long_title"]'
      image_url 'div[@id="product_image"] img', :text do |h|
        h.first['src']
      end
      price 'div[@id="product_price_list"] span[@itemprop="price"]' do |span|
        span.text.strip.gsub("¥","").to_i
      end
    end

  end

end