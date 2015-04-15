class SiteMovieDoubanCom
  include Spider

  def self.parse(url)
    id = url.split('/').last
    data = JSON.load(open("https://api.douban.com/v2/movie/#{id}"))

    fetch(url) do
      # title 'div[@id="content"] h1 span'
      # image_url 'div[@id="mainpic"] a img' do |h|
      #   h.first['src']
      # end

      # location 'div[@id="info"]' do |h|
      #   h.to_s.split('制片国家/地区:</span>')[1].split('<br>')[0].strip
      # end

      title do |h|
        data['title'] + ' ' + data['alt_title']
      end

      image_url do |h|
        data['image']
      end

      location do |h|
        data['attrs']['country'][0]
      end

      from {'豆瓣电影'}
    end

  end

end