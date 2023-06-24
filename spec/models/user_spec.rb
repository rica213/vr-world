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

  context 'Validation' do
    it 'validates the presence of a username' do
      expect(User.new(username: nil).valid?).to be false
    end

    it 'validates the uniqueness of a username' do
      user_one = User.new(username: 'Tao', email: 'zuigbi@ro.lk', password: '123456789')
      user_one.save
      user_two = User.new(username: 'Tao', email: 'iko@uman.lt', password: '123456789')
      expect(user_two.valid?).to be false
    end
  end
end
