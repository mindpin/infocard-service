class SiteLancome
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h2[@itemprop="description"]'
      image_url 'img[@class="proimg"]', :text do |h|
        'http://www.lancome.com.cn' + h.first['src']
      end
      price 'span[@id="price"]'
    end

  end

end