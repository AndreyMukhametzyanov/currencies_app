# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe CurrenciesController, type: :controller do

  describe '#index' do
    let!(:currencies) { create_list :currency, 3 }

    before { get :index }

    it 'should returns correct renders for #index' do
      expect(response).to have_http_status(200)
      expect(assigns(:currencies)).to eq(currencies)
      expect(response).to render_template('index')
    end
  end

  describe '#show' do
    let!(:currency) { create :currency }

    before { get :show, params: { char_code: currency.char_code } }

    it 'returns currency' do
      expect(response).to have_http_status(200)
      expect(assigns(:currency)).to eq(currency)
      expect(response).to render_template('show')
    end
  end

  describe '#update_rates' do
    let(:value_before_update) { 100 }
    let(:value_after_update) { 200 }

    let!(:currency) { create :currency, value: value_before_update }
    let(:fake_data) do
      [{ num_code: currency.num_code, value: value_after_update }]
    end

    before do
      post :update_rates
    end

    it 'should return updated currency and check redirect to root_path' do
      expect(response).to have_http_status(302)
      expect(UpdateRatesWorker).to have_enqueued_sidekiq_job
      expect(response).to redirect_to(root_path)
    end
  end
end
