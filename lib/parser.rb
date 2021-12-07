require 'net/http'
require 'uri'
require 'rexml/document'
require 'json'

class Parser
  CRB_PATH = 'https://www.cbr.ru/scripts/XML_daily.asp'

  def self.xml_into_hash
    crb_uri = URI.parse(CRB_PATH)
    response = Net::HTTP.get_response(crb_uri)
    doc = REXML::Document.new(response.body)
    doc.root.map do |element|
      {
        num_code: element.elements['NumCode'].text,
        char_code: element.elements['CharCode'].text,
        nominal: element.elements['Nominal'].text,
        name: element.elements['Name'].text,
        value: element.elements['Value'].text
      }
    end
  end
end