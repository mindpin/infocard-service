class SiteNop
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@id="good-view"] h1'
      image_url 'ul[@class="slides"] li img' do |h|
        h.first['src']
      end
      price 'span[@class="pdpricecur"] span'

      from {'NOP'}
    end

  end

end