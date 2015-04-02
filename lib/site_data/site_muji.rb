class SiteMuji
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@id="goodsNmArea"]'
      image_url 'img[@id="mainImage"]', :text do |h|
        h.first['src']
      end
      price 'div[@id="price"] span'
    end

  end

end