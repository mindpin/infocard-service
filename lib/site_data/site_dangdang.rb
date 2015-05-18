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


      title2 'div[@class="head"] h1'
      image_url2 'img[@id="largePic"]' do |h|
        h.first['src']
      end
      price2 'b[@id="d_price"]'

      from {'当当'}
    end

    p data[:title]
    p '====='

    data[:title] = data[:title].blank?? data[:title2]: data[:title]
    data[:image_url] = data[:image_url].nil?? data[:image_url2]: data[:image_url]
    data[:price] = data[:price].blank?? data[:price2]: data[:price]

    data

  end

end