class SiteTmall
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="tb-detail-hd"] h1'
      image_url 'img[@id="J_ImgBooth"]', :text do |h|
        h.first['src']
      end
      price 'div[@class="tm-promo-price"]'
      location 'span[@id="J_deliveryAdd"]'
      # price 'dt[@class="tb-metatit"]'
    end

  end

end