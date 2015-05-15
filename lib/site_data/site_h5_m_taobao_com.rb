class SiteH5MTaobaoCom
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="dtif-h"]'
      image_url 'ul[@class="dt-slct-ul"] li img' do |h|
        h.first['src']
      end

      price 'p[@id="item-price-line"] ins'


      from {'淘宝手机版'}

    end

  end

end