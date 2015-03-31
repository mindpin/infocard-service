require 'rails_helper'

describe Infocard do
  before {
    FakeWeb.allow_net_connect = false
  }

  describe '天猫' do

    before {
      file = Rails.root.to_s + "/spec/site_data/tmall.html"

      stream = File.read(file)
      stream = Iconv.conv(stream.encoding.name.to_s + '//IGNORE', 'gbk', stream)

      url = 'http://www.tmall.com'
      
      FakeWeb.register_uri(:get, 
        url, 
        :body => stream, 
        :content_type => "text/html"
      )

      @parser = InfocardParser.parse(url)
    }

    it 'title' do
      expect(@parser[:title]).to eq('御食园甘栗仁400g 栗子仁板栗仁铝箔包装零食 栗子栗仁怀柔板栗')
    end

  end

end
