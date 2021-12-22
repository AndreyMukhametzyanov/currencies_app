require 'rails_helper'

RSpec.describe CurrenciesController, type: :controller do
  describe 'parser' do

    let(:fake_xml) { "
  <ValCurs Date=\"23.12.2021\" name=\"Foreign Currency Market\">
    <Valute ID=\"R01010\">
      <NumCode>036</NumCode>
      <CharCode>AUD</CharCode>
      <Nominal>1</Nominal>
      <Name>Австралийский доллар</Name>
      <Value>52,6788</Value>
    </Valute>
    <Valute ID=\"R01020A\">
      <NumCode>944</NumCode>
      <CharCode>AZN</CharCode>
      <Nominal>1</Nominal>
      <Name>Азербайджанский манат</Name>
      <Value>43,4315</Value>
    </Valute>
  </ValCurs>" }

    before do
      stub_request(:post, 'https://www.cbr.ru/scripts/XML_daily.asp')
        .to_return(status: 200, body: { fake_xml: fake_xml }, headers: { 'Content-Type' => 'application/xml' })
    end

    it 'should return correct xml' do

      expect(response).to have_http_status(200)
    end
  end
end