class SiteTmall
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="tb-detail-hd"] h1'
      image_url 'img[@id="J_ImgBooth"]' do |h|
        h.first['src']
      end
      
      # price 'div[@class="tm-promo-price"]'
      
      location 'form[@id="J_FrmBid"]' do |h|
        h.at_css('input[@name="region"]').attributes["value"].value
      end

      price 'script' do |h|
        str = h.to_s
        items = str.scan('"defaultItemPrice":"')
        if items.length > 0
          str.split('"defaultItemPrice":"')[1].split('",')[0]
        else
          get_price
        end
      end

      from {'天猫'}
    end

  end

  def self.get_price
    pid = URI.parse(URI.encode(url)).query.split("&").select do |str|
      str.match(/id=.*/)
    end[0].gsub("id=","")
    mechanize = Mechanize.new
    mechanize.keep_alive = false
    mechanize.user_agent_alias = 'Windows Chrome'
    price_url = "http://mdskip.taobao.com/core/initItemDetail.htm?itemId=#{pid}"
    page = mechanize.get(price_url, parameters = [], referer = url )
    parse_price_by_reg(page.body)
  end

  # 正则解析 json 字符串中的 price
  def self.parse_price_by_reg(str)
    # str.scan(/\"price\"\:\"([^,]*)\",/).flatten.map{|p|p.to_f}.min
    items = str.scan('"price":"')
    if items.length > 0
      str.split('"price":"')[1].split('",')[0]
    end
  end

  # json 库解析这个json 总是抛异常，先用正则方案
  # def self.parse_price_json(json)
  #   price_info = json["defaultModel"]["itemPriceResultDO"]["priceInfo"]

  #   is_one_product = !price_info["def"].blank?
  #   if is_one_product
  #     # 商品只有一个类型
  #     has_preferential = !price_info["def"]["promotionList"].blank?
  #     if has_preferential
  #       # 商品有优惠价
  #       return price_info["def"]["promotionList"][0]["price"]
  #     else
  #       return price_info["def"]["price"]      
  #     end
  #   else
  #     # 商品有多个类型
  #     prices = []
  #     price_info.values.each do |pv|
  #       has_preferential = !pv["promotionList"].blank?
  #       if has_preferential
  #         prices << pv["promotionList"][0]["price"].to_f
  #       else
  #         prices << pv["price"].to_f
  #       end
  #     end
  #     return prices.min
  #   end
  # end

end