class SiteLarocheposay
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="product-name"] h1'
      image_url 'img[@id="image"]' do |h|
        h.first['src']
      end
      price 'div[@class="add-to-cart-price"] span[@class="price"]'

      from {'理肤泉'}
    end

  end

end