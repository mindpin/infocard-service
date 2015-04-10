class SiteDianping
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@class="shop-name"]' do |h|
        h.text.gsub('添加分店', '').strip
      end
      image_url 'img[@itemprop="photo"]' do |h|
        h.first['src']
      end
      price 'div[@class="brief-info"] span[@class="item"]' do |h|
        '人均: ' + h.text.split('人均：')[1].split('口味')[0].strip
      end
      location 'div[@class="expand-info address"] span' do |h|
        h.last.text.strip
      end
    end

  end

end