require 'rails_helper'

RSpec.describe Currency, type: :model do
  describe 'validations' do
    subject { build(:currency) }
    it { should validate_presence_of(:num_code) }
    it { should validate_presence_of(:char_code) }
    it { should validate_presence_of(:nominal) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:value) }

    it { should validate_uniqueness_of(:num_code).case_insensitive }
    it { should validate_uniqueness_of(:char_code) }
  end
end