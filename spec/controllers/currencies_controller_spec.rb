require 'rails_helper'

RSpec.describe CurrenciesController, type: :request do
  subject { JSON.parse(response.body).with_indifferent_access }
end