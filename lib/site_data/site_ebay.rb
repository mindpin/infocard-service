class SiteEbay
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@id="itemTitle"]' do |h|
        h.text.gsub('Details about', '').strip
      end
      image_url 'div[@id="mainImgHldr"] img' do |h|
        h[1]['src']
      end
      price 'span[@id="prcIsum"]'
      location 'div[@class="iti-eu-bld-gry "]'

      from {'ebay'}
    end

  end

end