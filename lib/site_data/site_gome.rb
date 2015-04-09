class SiteGome
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="prdtit"]'
      image_url 'div[@class="pic-big"] img' do |h|
        h.first['jqimg']
      end
      price 'span[@id="prdPrice"]'
    end

  end

end