require 'mechanize'

module Spider
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    attr_accessor :url, :page, :properties, :str_type, :target_pattern, :property, :callback

    def fetch(url, &block)
      @url = url
      mechanize = Mechanize.new
      mechanize.keep_alive = false
      mechanize.user_agent_alias = 'Windows Chrome'
      @page = mechanize.get(@url)
      
      @properties = {}

      self.instance_eval &block
    end

    def format_str(item, str_type)
      return @callback.call(item) unless @callback.nil?

      case str_type
      when :inner_html
        item.inner_html
      when :string
        item.to_s.strip
      else
        item.text.strip
      end
    end


    def build
      context = @page.search(@target_pattern)
      format_str(context, @str_type)
    end


    def method_missing method, *args, &block
      @property = method.to_sym
      @target_pattern = args[0]
      @str_type = args[1] || :text
      @callback = block

      @properties[property] = build
      @properties
    end
  end
end

