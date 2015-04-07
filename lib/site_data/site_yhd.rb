class SiteYhd
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@id="productMainName"]'
      image_url 'img[@id="J_prodImg"]', :text do |h|
        h.first['src']
      end
      price 'span[@class="current_price"]' do |h|
        pid = URI.parse(URI.encode(url)).path.gsub("/item/","")
        mechanize = Mechanize.new
        mechanize.keep_alive = false
        mechanize.user_agent_alias = 'Windows Chrome'
        price_url = "http://gps.yhd.com/restful/detail?mcsite=1&provinceId=4&pmId=#{pid}&callback=jsonp"
        page = mechanize.get(price_url)
        JSON.parse(page.body.gsub(/jsonp\((.*)\)/,"\\1"))["currentPrice"]
      end
    end

  end

end