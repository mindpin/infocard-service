class SiteWwwDoubanCom
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@id="content"] h1'
      image_url 'div[@class="pic"] a img', :text do |h|
        h.first['src']
      end
      author 'div[@class="app_info"] li span[@class="attr-value"]', :text do |h|
        h[1].text.strip
      end

      price 'div[@class="app_info"] span[@class="attr-value"]', :text do |h|
        h.last.text.strip
      end
    end

  end

end