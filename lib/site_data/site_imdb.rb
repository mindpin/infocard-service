class SiteImdb
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="header"] span'
      image_url 'td[@id="img_primary"] div[@class="image"] a img' do |h|
        h.first['src']
      end
      location 'div[@id="titleDetails"] div[@class="txt-block"]' do |h|
        h[1].text.gsub('Country:', '').strip
      end
    end

  end

end