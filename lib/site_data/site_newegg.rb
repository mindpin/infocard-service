class SiteNewegg
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@id="productTitle"] h1'
      image_url 'div[@class="picZoom"] img' do |h|
        h.first['src']
      end
      price 'input[@id="omHiddenPrice"]' do |h|
        h.first["value"]
      end
    end

  end

end