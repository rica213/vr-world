require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Association' do
    it 'has many studios' do
      expect(User.reflect_on_association(:studios).macro).to eq(:has_many)
    end

    it 'has many reservations' do
      expect(User.reflect_on_association(:reservations).macro).to eq(:has_many)
    end
  end
end
