class SiteMGomeComCn
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'p[@class="ellipsis_two product_title"] i'
      image_url 'div[@id="swiper_container"] img' do |h|
        h.first['src']
      end
      price 'section[@class="detail_price_content"] p em'

      from {'国美手机版'}

    end

  end

end