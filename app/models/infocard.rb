class Infocard

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

  

end