class SiteGome
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="prdtit"]'
      image_url 'div[@class="pic-big"] img', :text do |h|
        h.first['src']
      end
      price 'span[@id="prdPrice"]'
    end

  end

end