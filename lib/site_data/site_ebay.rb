class SiteEbay
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@id="itemTitle"]'
      image_url 'div[@id="mainImgHldr"] img', :text do |h|
        h.first['src']
      end
      price 'span[@id="prcIsum"]'
      location 'div[@class="iti-eu-bld-gry "]'
    end

  end

end