class SiteMDangdangCom
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'section[@class="name_box"] p[@class="name"]'

      image_url 'ul[@id="scroller_ul"] img' do |h|
        h.first['src']
      end
      price 'p[@class="change_price outlets_price"]'

      from {'当当手机版'}
    end

  end

end