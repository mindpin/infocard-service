class SiteUjipin
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'h4[@class="title"]'
      image_url 'div[@class="show"] img', :text do |h|
        h.first['src']
      end
      price 'div[@class="right"] h3'
    end

  end

end