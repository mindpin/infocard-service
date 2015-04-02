class SiteOkbuy
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="prodAllName"]'
      image_url 'p[@class="pBigPic"] img', :text do |h|
        h.first['src']
      end
      price 'span[@id="prodPriceAj"]'
    end

  end

end