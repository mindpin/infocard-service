class SiteWandoujia
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'span[@class="title"]'
      image_url 'div[@class="app-icon"] img' do |h|
        h.first['src']
      end

      author 'dd[@itemprop="author"] meta[@itemprop="name"]' do |h|
        h.first['content']
      end

    end

  end

end