class SiteDianping
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="shop-name"]'
      image_url 'div[@class="photos"] a img', :text do |h|
        h.first['src']
      end
      price 'div[@class="brief-info"] span[@class="item"]'
      location 'div[@class="expand-info address"]'
    end

  end

end