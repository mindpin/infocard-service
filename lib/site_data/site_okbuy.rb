class SiteOkbuy
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="prodAllName"]'
      image_url 'p[@class="pBigPic"] img', :text do |h|
        h.first['src']
      end
      price 'span[@id="prodPriceAj"]' do |h|
        # http://www.okbuy.com/p-nike/detail-clothes-17080471.html
        # http://www.okbuy.com/p-converse/detail-shoe-17062168.html
        # http://www.okbuy.com/p-lining/detail-clothes-17188394.html
        pid = URI.parse(URI.encode(url)).path.split("/")[-1].match(/-([0-9]*)\.html/)[1]
        mechanize = Mechanize.new
        mechanize.keep_alive = false
        mechanize.user_agent_alias = 'Windows Chrome'
        price_url = "http://www.okbuy.com/ajax/product/info/#{pid}"
        page = mechanize.get(price_url)
        JSON.parse(page.body)["salepr"]
      end
    end

  end

end