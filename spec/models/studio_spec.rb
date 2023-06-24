require 'rails_helper'

RSpec.describe Studio, type: :model do
    before(:each) do
        @user = User.create(username: "Mr Kaplan", admin: true, email: "kaplan@gmail.com", password: "123456789")
        @studio = Studio.create(name: "Journey to the moon", description: "Space travel what do you think", price: 234.11, duration: 2, location: "Alaska", working_hours: "mon-fri", image_url: "www.travel.com/space", contact: "+11203333822", rating: 3, user_id: @user.id)
    end

    it 'should create a new studio for user' do
        expect(@studio).to be_valid
    end
end