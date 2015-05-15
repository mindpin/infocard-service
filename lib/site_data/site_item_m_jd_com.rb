class SiteItemMJdCom
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@id="title"]'
      image_url 'div[@id="imgSlider"] img' do |h|
        h.first['src']
      end
      price 'span[@id="price"]'

      from {'京东手机版'}

    end

  end

end