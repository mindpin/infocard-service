class SiteItruelife
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="detail-main"] h1'
      # image_url 'div[@id="wrap"] img', :text do |h|
      #   h.first['src']
      # end
      price 'ins[@class="ff_arial"]'
    end

  end

end