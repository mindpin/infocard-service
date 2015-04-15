class SiteMyapp
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="det-name-int"]'
      image_url 'div[@class="det-icon"] img' do |h|
        h.first['src']
      end

      author 'div[@class="det-othinfo-data"]' do |h|
        h.last.text.strip
      end

      from {'应用宝'}

    end

  end

end