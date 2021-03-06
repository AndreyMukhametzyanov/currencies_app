# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Parser do
  describe '#xml_into_hash' do
    let(:my_xml) do
      <<~XML
        <?xml version='1.0' encoding='UTF-8'?>
          <ValCurs Date="23.12.2021" name="Foreign Currency Market">
           <Valute ID="R01010">
           <NumCode>036</NumCode>
           <CharCode>AUD</CharCode>
           <Nominal>1</Nominal>
           <Name>Австралийский доллар</Name>
           <Value>52,6788</Value>
           </Valute>
           <Valute ID="R01020A">
           <NumCode>944</NumCode>
           <CharCode>AZN</CharCode>
           <Nominal>1</Nominal>
           <Name>Азербайджанский манат</Name>
           <Value>43,4315</Value>
           </Valute>
           </ValCurs>
      XML
    end

    let(:result) do
      [{ num_code: '036', char_code: 'AUD', nominal: '1', name: 'Австралийский доллар', value: '52.6788' },
       { num_code: '944', char_code: 'AZN', nominal: '1', name: 'Азербайджанский манат', value: '43.4315' }]
    end

    before do
      stub_request(:get, 'https://www.cbr.ru/scripts/XML_daily.asp')
        .to_return(status: 200, body: my_xml.split("\n").map(&:strip)
                                            .join, headers: { 'Content-Type' => 'application/xml' })
    end

    it 'should return correct hash' do
      expect(CbrParser.xml_into_hash).to eq(result)
    end
  end
end
