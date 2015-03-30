class SiteTmall
  include Spider

  def self.parse(url)

    fetch(url) do
      title 'div[@class="tb-detail-hd"] h1'
    end

  end

end