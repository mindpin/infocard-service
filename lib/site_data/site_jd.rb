class SiteJd
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@id="name"] h1'
      image_url 'div[@id="preview"] img', :text do |h|
        h.first['src']
      end
      price 'strong[@id="jd-price"]' do |h|
        pid = URI.parse(URI.encode(url)).path.gsub("/","").gsub(".html","")
        mechanize = Mechanize.new
        mechanize.keep_alive = false
        mechanize.user_agent_alias = 'Windows Chrome'
        price_url = "http://p.3.cn/prices/get?skuid=J_#{pid}&type=1&area=5_142_143&callback=cnp"
        page = mechanize.get(price_url)
        JSON.parse(page.body.gsub(/cnp\((.*)\);/,"\\1"))[0]["p"]
      end
    end

  end

end