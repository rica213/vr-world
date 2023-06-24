require 'rails_helper'

RSpec.describe Studio, type: :model do
    before(:each) do
        @user = User.create(username: "Mr Kaplan", admin: true, email: "kaplan@gmail.com", password: "123456789")
        @studio = Studio.create(name: "Journey to the moon", description: "Space travel what do you think", price: 234.11, duration: 2, location: "Alaska", working_hours: "mon-fri", image_url: "www.travel.com/space", contact: "+11203333822", rating: 3, user_id: @user.id)
    end

    it 'should create a new studio for user' do
        expect(@studio).to be_valid
    end

    it 'should not create a studio if name is nil' do
        @studio.name = nil
        expect(@studio).to_not be_valid
    end

    it 'should not craete a studio if price is nil' do
        @studio.price = nil
        expect(@studio).to_not be_valid
    end

    it 'should not create a studio if duration is nil' do
        @studio.duration = nil
        expect(@studio).to_not be_valid
    end

    it 'should not create a studio if rating is nil' do
        @studio.rating = nil
        expect(@studio).to_not be_valid
    end

    it 'should not create a studio if price is less than or equal to zero' do
        @studio.price = -1
        expect(@studio).to_not be_valid
    end

    it 'should not create studio if duration is a string' do
        @studio.duration = 'two hours'
        expect(@studio).to_not be_valid
    end

    it 'should not create studio if rating is not in the range of 1 to 5' do
        @studio.rating = 6
        expect(@studio).to_not be_valid
    end

    it 'should not create a studio if description is nil' do
        @studio.description = nil
        expect(@studio).to_not be_valid
    end

    it 'should not create a studio if working is nil' do
        @studio.working_hours = nil
        expect(@studio).to_not be_valid
    end


end