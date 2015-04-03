class SiteImdb
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="header"] span'
      image_url 'td[@id="img_primary"] div[@class="image"] a img', :text do |h|
        h.first['src']
      end
      # location 'dl[@class="info_l"] dd' do |h|
      #   h[2].text
      # end
    end

  end

end