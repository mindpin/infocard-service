class SiteJd
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'div[@id="name"] h1'
      image_url 'div[@id="preview"] img', :text do |h|
        h.first['src']
      end
      price 'strong[@id="jd-price"]'
    end

  end

end