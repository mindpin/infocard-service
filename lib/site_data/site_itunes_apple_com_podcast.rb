class SiteItunesAppleComPodcast
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@id="title"] h1'
      image_url 'div[@id="left-stack"] meta' do |h|
        h.first['content']
      end
      price 'li span[@class="price"]'

      author 'div[@id="title"] h2' do |h|
        h.text.strip.gsub('By', '').strip
      end
    end

  end

end