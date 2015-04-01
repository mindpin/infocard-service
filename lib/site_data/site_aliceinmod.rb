class SiteAliceinmod
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h1[@id="goods_title_id"]'
      image_url 'ul[@id="new_pic_list"] li img', :text do |h|
        h.first['src']
      end
      price 'span[@id="price1"]'
    end

  end

end