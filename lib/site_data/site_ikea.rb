class SiteIkea
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@id="name"]'
      image_url 'img[@id="productImg"]' do |h|
        'http://' + URI.parse(url).host + "/" + h.first['src']
      end
      price 'span[@id="price1"]'

      from {'宜家'}
    end

  end

end