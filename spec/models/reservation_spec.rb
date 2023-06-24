require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @user = User.create!(username: 'ambrose2', admin: true, email: 'a@2.a', password: '123456')
    @studio = Studio.create!(name: 'Abcd', description: 'lorem lorem lorem lorem lorem lorem lorem lorem lorem ',
                             price: 1, duration: 1, location: 'chernobyl', working_hours: 'Mon-Fri',
                             image_url: 'https://img.icons8.com/?size=512&id=FMPXwiWsNx4v&format=png',
                             contact: 'somemail@mail.mail', user: @user)
    @reservation = Reservation.create!(reservation_date: '22-1-2024', location: @studio.location, user: @user,
                                       studio: @studio)
  end
  describe 'validations' do
    it 'should have reservation_date present' do
      @reservation.reservation_date = nil
      expect(@reservation).to_not be_valid
    end
    it 'should have location present' do
      @reservation.location = nil
      expect(@reservation).to_not be_valid
    end
    it 'should have user_id present' do
      @reservation.user_id = nil
      expect(@reservation).to_not be_valid
    end
    it 'should have studio_id present' do
      @reservation.studio_id = nil
      expect(@reservation).to_not be_valid
    end
    it 'should create a valid reservation with all corrrect inputs' do
      expect(@reservation).to be_valid
    end
  end
  describe 'associations' do
    it 'belongs to user' do
      reservation = Reservation.reflect_on_association(:user)
      expect(reservation.macro).to eq(:belongs_to)
    end
    it 'belongs to studio' do
      reservation = Reservation.reflect_on_association(:studio)
      expect(reservation.macro).to eq(:belongs_to)
    end
  end
end
