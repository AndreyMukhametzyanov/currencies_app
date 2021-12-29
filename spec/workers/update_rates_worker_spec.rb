# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateRatesWorker, type: :worker do
  it 'should call interaction' do
    expect(UpdateRates).to receive(:run).with(logger: Sidekiq.logger).and_return(true)
    UpdateRatesWorker.new.perform
  end
end
