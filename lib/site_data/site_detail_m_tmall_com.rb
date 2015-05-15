class SiteDetailMTmallCom
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'section[@id="s-title"] div[@class="main"] h1'
      image_url 'section[@id="s-showcase"] img' do |h|
        h.first['src']
      end
      
      price 'b[@class="ui-yen"]'
      
      # location 'div[@class="logistics"] span[@class="from"]'
      location 'body' do |str|
        str.first.to_s.split('"deliveryAddress":"')[1].split('",')[0]
      end


      from {'天猫手机版'}

    end

  end

end