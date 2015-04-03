class SiteDuokan
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="desc"] h3'
      image_url 'div[@id="cover-img"] a img', :text do |h|
        h.first['src']
      end
      author 'td[@class="author"] a'
      price 'div[@class="price"] em'
    end

  end

end