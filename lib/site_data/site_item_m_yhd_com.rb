class SiteItemMYhdCom
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h2[@id="pd_product-title"]'
      image_url 'div[@class="public_com-swipeSlide"] ul li a img' do |h|
        h.first['src']
      end
      price 'strong[@class="pd_product-price-num"]'

      from {'一号店手机版'}
    end

  end

end