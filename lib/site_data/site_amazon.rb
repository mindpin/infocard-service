class SiteAmazon
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'span[@id="productTitle"]'

      image_url 'script' do |h|
        str = h.to_s
        items = str.scan('"large":"')

        if items.length > 0
          a = str.split('"large":"')[1]
          a.split('",')[0] if a
        else
          a = str.split('"L" : "')[1]
          a.split('",')[0] if a
        end
      end

      image_url2 'img[@id="imgBlkFront"]' do |h|
        h.first['src']
      end

      price 'span[@id="priceblock_ourprice"]'
      price2 'span[@class="a-size-medium a-color-price inlineBlock-display offer-price a-text-normal price3P"]'

      from {"亚马逊（中国）"}
    end

    data[:image_url] = data[:image_url].nil?? data[:image_url2]: data[:image_url]
    data[:price] = data[:price].blank?? data[:price2]: data[:price]

    data


  end

end