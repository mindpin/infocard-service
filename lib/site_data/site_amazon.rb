class SiteAmazon
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'span[@id="productTitle"]'
      # image_url 'img[@id="landingImage"]' do |h|
      #   h.first['data-old-hires']
      # end

      image_url 'script' do |h|
        str = h.to_s
        items = str.scan('"large":"')
        if items.length > 0
          a = str.split('"large":"')[1].split('",')[0]
        else
          str.split('"L" : "')[1].split('",')[0]
        end
      end

      price 'span[@id="priceblock_ourprice"]'
      from {"亚马逊（中国）"}
    end

  end

end