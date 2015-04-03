class SiteItunesAppleComBook
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@id="title"] h1'
      image_url 'div[@class="artwork"] img', :text do |h|
        h.first['src']
      end
      price 'li div[@class="price"]'

      author 'div[@id="title"] h2', :text do |h|
        h.text.strip.gsub('By', '').strip
      end
    end

  end

end