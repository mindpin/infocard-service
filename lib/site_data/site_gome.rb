class SiteGome
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="prdtit"]'
      image_url 'div[@class="pic-big"] img' do |h|
        h.first['jqimg']
      end
      price 'script' do |h|
        h.to_s.split('price:"')[1].split('",')[0]
      end

      from {'国美'}
    end

  end

end