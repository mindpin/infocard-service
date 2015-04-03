class SiteAppchina
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="app-name"]'
      image_url 'div[@class="msg"] img', :text do |h|
        h.first['src']
      end

      author 'p[@class="art-content"] b'

    end

  end

end