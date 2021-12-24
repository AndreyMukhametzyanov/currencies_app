require 'rails_helper'

RSpec.describe ListCurrencies do
  subject { described_class.run }

  let!(:currencies) { create_list :currency, 3 }
  let(:record_keys) { %w[id phone first_name last_name date_of_birth comment created_at updated_at] }

  it 'return all users with status ok' do
    # expect(response).to have_http_status(200)
    expect(subject[:status]).to eq('ok')
    expect(subject[:data].count).to eq(user.count)
    expect(subject[:data].first.keys).to match_array(record_keys)
  end

end