class SiteTaobao
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h3[@class="tb-main-title"]'
      image_url  'script' do |h|
        h.to_s.split('auctionImages:[')[1].split(',')[0].gsub('"', '').strip
      end
      price 'strong[@id="J_StrPrice"] em[@class="tb-rmb-num"]'
    end

  end

end