class SiteItunesAppleComAppstore
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@itemprop="name"]'
      image_url 'div[@id="left-stack"] meta', :text do |h|
        h.first['content']
      end
      price 'div[@class="price"]'

      author 'span[@itemprop="name"]'
    end

  end

end