class SiteVip
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="bt_crumbs"] span'

      image_url 'img[@class="bt_good_img"]' do |h|
        h.first['src']
      end
      price 'p[@class="bt_infos_price "]'

      from {'唯品会'}
    end

  end

end