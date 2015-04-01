class SiteYhd
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@id="productMainName"]'
      image_url 'img[@id="J_prodImg"]', :text do |h|
        h.first['src']
      end
      price 'span[@class="current_price"]'
    end

  end

end