class SiteAnzhi
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@class="detail_line"] h3'
      image_url 'div[@class="detail_icon"] img' do |h|
        "http://www.anzhi.com" + h.first['src']
      end

      price 'ul[@id="detail_line_ul"] li span[@class="spaceleft"]' do |h|
        h.last.text.strip.gsub('资费：', '')
      end

      author 'ul[@id="detail_line_ul"] li' do |h|
        h.last.text.strip.gsub('作者：', '')
      end

      from {"安智市场"}
    end

  end

end