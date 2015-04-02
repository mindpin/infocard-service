class SiteLancome
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@itemprop="name"]'
      image_url 'img[@class="proimg"]', :text do |h|
        h.first['src']
      end
      price 'span[@id="price"]'
    end

  end

end