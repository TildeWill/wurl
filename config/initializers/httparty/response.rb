require 'httparty'

module HTTParty
  class Response < HTTParty::BasicObject
    class Headers
      def initialize(header = {})
        @header = header
      end

      def to_html(options = {:line_numbers => nil})
        headers = []
        each_capitalized do |name, value|
          headers << "<span style='color: #808'>#{name}</span>: <span style='color: #088'>#{value}</span>"
        end
        "<pre>#{headers.join("\n")}</pre>".html_safe
      end
    end
  end
end
