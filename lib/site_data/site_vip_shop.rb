class SiteVipShop
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'p[@class="pib-title-detail"]'
      image_url 'div[@class="show-midpic "] a img' do |h|
        h.first['src']
      end
      price 'span[@class="pbox-price"]'
    end

  end

end