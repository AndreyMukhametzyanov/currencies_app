require 'rails_helper'

RSpec.describe UpdateRates do

  let(:value_before_update) { 100 }
  let(:value_after_update) { 200 }

  let!(:currency) { create :currency, value: value_before_update }
  let(:fake_data) do
    [{ num_code: currency.num_code, value: value_after_update }]
  end

  before do
    expect(Parser).to receive(:xml_into_hash).and_return(fake_data)
  end

  it 'should return updated currency ' do
    expect(Parser.xml_into_hash.first[:value]).to eq(value_after_update)
  end
end