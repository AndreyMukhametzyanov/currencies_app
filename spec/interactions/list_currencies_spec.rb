# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListCurrencies do
  subject { described_class.run }

  context 'when currency is exists' do
    let!(:currencies) { create_list :currency, 3 }
    let(:record_keys) { %w[id num_code char_code nominal name value created_at updated_at] }

    it 'return all users with status ok' do
      expect(subject).to be_valid
      expect(subject.result.count).to eq(3)
    end
  end

  context 'when currency does not exists' do
    let(:invalid_currency) { [id: 'alert'] }
    it 'should return error' do
      expect(subject).to_not be_valid
      expect(subject.errors.messages_for(:currencies).first).to eq('There is no currencies exists!')
    end
  end
end
