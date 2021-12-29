# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateRatesWorker, type: :worker do
  let(:value_before_update) { 100 }
  let(:value_after_update) { 200 }

  let!(:currency) { create :currency, value: value_before_update }
  let(:fake_data) do
    [{ num_code: currency.num_code, value: value_after_update }]
  end

  it 'should call interaction' do
    expect(UpdateRates).to receive(:run).and_return(fake_data)
    UpdateRatesWorker.new.perform
  end
end
