class SiteKnewone
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@id="thing_title"] h1'
      image_url 'img[@class="sharing_cover"]' do |h|
        h.first['src']
      end
      price 'div[@id="price"]'
    end

  end

end