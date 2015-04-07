class SitePage

  include Mongoid::Document
  include Mongoid::Timestamps

  field :url,        type: String
  field :hostname,        type: String
  field :homepage,        type: String
  field :image_url,        type: String
  field :title,        type: String
  field :desc,        type: String
  field :price,        type: String
  field :location,        type: String
  field :author,        type: String


  validates_uniqueness_of :url, :case_sensitive => false


  scope :by_url, ->(url) { where(:url => url) }

  
  def self.parse_url(url)
    site_page = SitePage.by_url(url).first

    if site_page.blank?
      parser = SitePageParser.new(url)
      site_page = SitePage.create(
        :url => parser.url,
        :hostname => parser.hostname,
        :homepage => parser.homepage,
        :title => parser.title,
        :image_url => parser.image_url,
        :price => parser.price,
        :location => parser.location,
        :author => parser.author
      )
    end
    
    return site_page
  rescue Exception => e
    puts e.message
    puts e.backtrace
    raise "无法解析该地址" 
  end

  def api_hash
    {
      url: self.url,
      hostname: self.hostname,
      homepage: self.homepage,
      image_urls: [self.image_url],
      title: self.title,
      desc: self.desc,
      price: self.price,
      location: self.location,
      author: self.author
    }
  end
end