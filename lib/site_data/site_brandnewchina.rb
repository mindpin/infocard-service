class SiteBrandnewchina
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'p[@class="product_name"] span'
      image_url 'div[@class="product_pw"] img' do |h|
        h.first['src']
      end
      price 'span[@class="originalprice"]'

      from {'薄荷糯米葱'}
    end

  end

end