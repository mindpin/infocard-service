class SiteLifevc
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'p[@class="sName"]'
      image_url 'img[@class="j_previewimg"]', :text do |h|
        h.first['src']
      end
      price 'p span[@class="salePrice"] em'
    end

  end

end