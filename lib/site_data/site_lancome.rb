class SiteLancome
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h2[@itemprop="description"]'
      image_url 'img[@class="proimg"]' do |h|
        'http://www.lancome.com.cn' + h.first['src']
      end
      price 'span[@id="price"]'

      from {'兰蔻（中国）'}
    end

  end

end