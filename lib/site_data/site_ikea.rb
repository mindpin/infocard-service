class SiteIkea
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@id="name"]'
      image_url 'img[@id="productImg"]', :text do |h|
        URI.parse(url).host + "/" + h.first['src']
      end
      price 'span[@id="price1"]'
    end

  end

end