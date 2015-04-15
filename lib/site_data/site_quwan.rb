class SiteQuwan
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="infor"] h1'
      image_url 'img[@turnxml="0"]' do |h|
        h.first['src']
      end
      price 'dt[@id="price_goods_div"] strong'

      from {'趣玩'}
    end

  end

end