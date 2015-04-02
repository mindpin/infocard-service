class SiteYohobuy
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="title"] h2'
      image_url 'img[@id="bigImage"]', :text do |h|
        h.first['src']
      end
      price 'span[@class="price-sale"]'
    end

  end

end