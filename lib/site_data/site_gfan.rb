class SiteGfan
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h4[@class="curr-tit"]'
      image_url 'div[@class="descr-left"] img' do |h|
        h.first['src']
      end

      author 'div[@class="app-info"] p' do |h|
        h[1].text.strip.gsub('开 发 者：', '')
      end

    end

  end

end