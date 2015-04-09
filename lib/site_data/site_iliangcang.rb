class SiteIliangcang
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="gdName"]'
      image_url 'div[@class="imgList"] img' do |h|
        h.first['src']
      end
      price 'span[@id="goodsPrice"]'
    end

  end

end