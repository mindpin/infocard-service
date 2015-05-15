class SiteMIkeaCom
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="ikea-product-tag"] h1'
      image_url 'div[@class="ikea-pip-fullImageWrapper"] img' do |h|
        h.first['src']
      end
      price 'div[@class="ikea-product-pricetag-price"] span[@class="inline"]'

      from {'宜家手机版'}
    end

  end

end