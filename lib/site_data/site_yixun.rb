class SiteYixun
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="xname"]'
      image_url 'div[@id="xgalleryShow"] img' do |h|
        h.first['src']
      end
      price 'dl[@class="xbase_item xprice"] span[@class="mod_price xprice_val"]'

      from {'易迅'}
    end

  end

end