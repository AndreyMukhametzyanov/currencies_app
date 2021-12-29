# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FindCurrency do
  context 'when the currency exists' do
    let!(:currency) { create :currency, char_code: 'MYC' }

    subject { described_class.run(char_code: 'MYC') }

    it 'should return currency ' do
      expect(subject).to be_valid
      expect(subject.result).to eq(currency)
    end
  end

  context 'when the currency does not exists' do
    let(:fake) { 'YE' }
    subject { described_class.run(char_code: fake) }

    it 'should return error message' do
      expect(subject).to_not be_valid
      expect(subject.errors.messages_for(:currency).to_sentence).to eq("Currency with char_code = #{fake} is not found!")
    end
  end
end
