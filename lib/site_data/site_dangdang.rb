class SiteDangdang
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="head"] h1'
      image_url 'div[@id="largePicDiv"] img', :text do |h|
        h.first['src']
      end
      price 'span[@id="salePriceTag"]'
    end

  end

end