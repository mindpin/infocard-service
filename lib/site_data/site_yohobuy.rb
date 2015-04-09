class SiteYohobuy
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="title"] h2'
      image_url 'img[@id="bigImage"]' do |h|
        h.first['src']
      end
      price do |b|
        b.text.match(/custom\['price'\] = (.*);/)[1]
      end
    end

  end

end