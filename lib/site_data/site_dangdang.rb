class SiteDangdang
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="head"] h1' do |item|
        item.to_s.split('<span')[0].gsub('<h1>', '').strip
      end
      image_url 'div[@id="mainimg_pic"] img' do |h|
        h.first['src']
      end
      price 'span[@id="salePriceTag"]'
    end

  end

end