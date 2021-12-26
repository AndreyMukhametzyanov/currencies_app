# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FindCurrency do

  context 'when the currency exists' do
    let!(:currency) { create :currency }
    let(:fake_char_code) { 'MYC' }

    subject { described_class.run(char_code: fake_char_code) }

    let(:num_code) { "777" }
    let(:char_code) { "MYC" }
    let(:nominal) { 100 }
    let(:name) { "My Currency" }
    let(:value) { 12.12 }

    it 'should return currency ' do
      expect(subject).to be_valid
      expect(subject.result.num_code).to eq(num_code)
      expect(subject.result.char_code).to eq(char_code)
      expect(subject.result.nominal).to eq(nominal)
      expect(subject.result.name).to eq(name)
      expect(subject.result.value).to eq(value)
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
