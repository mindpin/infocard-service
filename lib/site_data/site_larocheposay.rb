class SiteLarocheposay
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="product-name"] h1'
      # image_url 'div[@id="product-image"] img', :text do |h|
      #   h.first['src']
      # end
      price 'div[@class="add-to-cart-price"] span[@class="price"]'
    end

  end

end