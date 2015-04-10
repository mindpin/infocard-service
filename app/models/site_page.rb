class SitePage

  include Mongoid::Document
  include Mongoid::Timestamps

  module Status
    PARSED = 'PARSED'
    SEO = 'SEO'
  end 

  field :url,        type: String
  field :hostname,        type: String
  field :homepage,        type: String
  field :image_url,        type: String
  field :title,        type: String
  field :desc,        type: String
  field :price,        type: String
  field :location,        type: String
  field :author,        type: String

  # 标识为当前这条记录是用于 seo, 还是用于 price, image_url 的获取
  field :status,        type: String


  validates_uniqueness_of :url, :case_sensitive => false


  scope :by_url, ->(url) { where(:url => url) }

  
  def self.parse_url(url)
    site_page = SitePage.by_url(url).first
    return site_page if site_page

    parser = SitePageParser.new(url)
    SitePage.create(
      :url => parser.url,
      :hostname => parser.hostname,
      :homepage => parser.homepage,
      :title => parser.title,
      :image_url => parser.image_url,
      :price => parser.price,
      :location => parser.location,
      :author => parser.author,
      :status => SitePage::Status::PARSED
    )
    
  rescue Exception => e
    puts e.message
    puts e.backtrace

    begin
      parse_seo(url)
    rescue => e
      raise "无法解析该地址" 
    end

    
  end


  def self.parse_seo(url)
    parser = SiteSeoParser.new(url)
    SitePage.create(
      :url => parser.url,
      :hostname => parser.hostname,
      :homepage => parser.homepage,
      :title => parser.title,
      :status => SitePage::Status::SEO
    )
  end

  def api_hash
    if self.status == SitePage::Status::PARSED
      return {
        :status => SitePage::Status::PARSED,
        :data => {
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
      }
    end


    {
      :status => SitePage::Status::SEO,
      :data => {
        url: self.url,
        hostname: self.hostname,
        homepage: self.homepage,
        title: self.title
      }
    }

  end
end