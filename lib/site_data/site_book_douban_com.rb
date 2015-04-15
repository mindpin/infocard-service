class SiteBookDoubanCom
  include Spider

  def self.parse(url)
    id = url.split('/').last
    data = JSON.load(open("https://api.douban.com/v2/book/#{id}"))


    fetch(url) do
      # title 'div[@id="wrapper"] h1 span'
      # image_url 'div[@id="mainpic"] a img' do |h|
      #   h.first['src']
      # end
      # author 'div[@id="info"] span a' do |h|
      #   h.first.text
      # end
      # price 'div[@id="info"]' do |h|
      #   h.to_s.split('定价:</span>')[1].split('<br>')[0].strip
      # end

      title do |h|
        data['title'] + ' ' + data['alt_title']
      end

      image_url do |h|
        data['image']
      end

      author do |h|
        data['author'][0]
      end

      price do |h|
        data['price']
      end

      from {'豆瓣读书'}


    end

  end

end