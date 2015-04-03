class SiteTmall
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="tb-detail-hd"] h1'
      image_url 'img[@id="J_ImgBooth"]', :text do |h|
        h.first['src']
      end
      price 'div[@class="tm-promo-price"]'
      location 'form[@id="J_FrmBid"]', :text do |h|
        h.at_css('input[@name="region"]').attributes["value"].value
      end

      # price 'dt[@class="tb-metatit"]'
    end

  end

end