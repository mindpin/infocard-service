class SiteVancl
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@id="productTitle"] h2'
      image_url 'div[@id="vertical"] img', :text do |h|
        h.first['src']
      end
      price 'span[@class="tehuiMoney"] span strong'
    end

  end

end