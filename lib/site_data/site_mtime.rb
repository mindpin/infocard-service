class SiteMtime
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="db_head"] h1'
      image_url 'div[@class="db_cover __r_c_"] a img' do |h|
        h.first['src']
      end
      location 'dl[@class="info_l"] dd' do |h|
        h[2].text.gsub('国家地区：', '').strip
      end
    end

  end

end