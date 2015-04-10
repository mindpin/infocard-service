class SiteUjipin
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h4[@class="title"]'
      image_url 'div[@id="goodsFoucs"] ul a' do |h|
        h.first['href']
      end
      # price 'div[@class="right"] h3' do |h|
      #   h.text.strip.match(/¥([0-9]*)/)[1]
      # end
      price 'div[@class="right"] h3' do |h|
        h.text.gsub('售价：', '').strip
      end
    end

  end

end