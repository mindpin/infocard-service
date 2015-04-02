class SiteQuwan
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="infor"] h1'
      image_url 'div[@id="wrap"] img', :text do |h|
        h.first['src']
      end
      price 'dt[@id="price_goods_div"] strong'
    end

  end

end