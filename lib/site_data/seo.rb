class Seo
  include Spider

  def self.parse(url)
    fetch(url) do
      title 'title'
    end

  end

end