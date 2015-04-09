class SiteMovieDoubanCom
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@id="content"] h1 span'
      image_url 'div[@id="mainpic"] a img' do |h|
        h.first['src']
      end

      location 'div[@id="info"]' do |h|
        h.to_s.split('制片国家/地区:</span>')[1].split('<br>')[0].strip
      end
    end

  end

end