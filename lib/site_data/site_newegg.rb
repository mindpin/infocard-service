class SiteNewegg
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@id="productTitle"] h1'
      image_url 'div[@class="picZoom"] img', :text do |h|
        h.first['src']
      end
      # price 'span[@class="price-sale"]'
    end

  end

end