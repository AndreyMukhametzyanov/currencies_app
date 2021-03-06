# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateRates do
  subject { UpdateRates.run(logger: Sidekiq.logger) }

  let(:value_before_update) { 100 }
  let(:value_after_update) { 200 }
  let!(:currency) { create :currency, value: value_before_update }
  let(:updated_data) do
    [{ num_code: currency.num_code, value: value_after_update }]
  end

  before do
    expect(CbrParser).to receive(:xml_into_hash).and_return(updated_data)
  end

  it 'should return updated currency' do
    is_expected.to be_valid
    expect(Currency.all.first&.value).to eq(value_after_update)
  end
end
