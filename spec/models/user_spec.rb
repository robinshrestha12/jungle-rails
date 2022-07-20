require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

 describe 'Validations' do
  it "is valid" do
    @user = User.new(
      first_name: "first_name",
      last_name: "last_name",
      email: "emailtest@email.com",
      password: "password",
      password_confirmation: 'password'
    )

    expect(@user).to be_valid
  end

  it 'email required' do  
    @user = User.new(
      first_name: "first_name",
      last_name: "last_name",
      email: nil,
      password: "password",
      password_confirmation: 'password'
    )
    @user.validate

    expect(@user.errors[:email]).to include("can't be blank")

    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it 'email must be unique' do  
    @user = User.new(
      first_name: "first_name",
      last_name: "last_name",
      email: "TEST@TEST.com",
      password: "password",
      password_confirmation: 'password'
      
    )
    @user.save

    @user1 = User.new(
      first_name: "first_name",
      last_name: "last_name",
      email: "test@test.com",
      password: "password",
      password_confirmation: 'password'
      
    )
    @user1.save
  

    expect(@user1.errors[:email].first).to eq('has already been taken')

  end

  it 'first_name required' do  
    @user = User.new(
      first_name: nil,
      last_name: "last_name",
      email: "email@email.com",
      password: "password",
      password_confirmation: 'password'
    )
    @user.validate

    expect(@user.errors[:first_name]).to include("can't be blank")

  end
 
  it 'last_name required' do  
    @user = User.new(
      first_name: "first_name",
      last_name: nil,
      email: "email@email.com",
      password: "password",
      password_confirmation: 'password'
    )
    @user.validate

    expect(@user.errors[:last_name]).to include("can't be blank")
   
  end
  it 'Password should match' do  
    @user = User.new(
      first_name: "first_name",
      last_name: "last_name",
      email: "email@email.com",
      password: "password",
      password_confirmation: 'pass'
    )
    @user.validate

    expect(@user.errors[:password_confirmation]).to be_present
   
  end

  it 'Password length should be 5 characters' do  
    @user = User.new(
      first_name: "first_name",
      last_name: "last_name",
      email: "email@email.com",
      password: "12345",
      password_confirmation: '12345'
    )
    expect(@user).to be_valid
   
  end
  it 'Password length less than 5 characters to be invalid' do  
    @user = User.new(
      first_name: "first_name",
      last_name: "last_name",
      email: "email@email.com",
      password: "1234",
      password_confirmation: '1234'
    )
    expect(@user).to be_invalid
   
  end
end
describe '.authenticate_with_credentials' do
  # examples for this class method here
  it 'Should pass with valid credential' do  
    @user = User.new(
      first_name: "first_name",
      last_name: "last_name",
      email: "email@email.com",
      password: "password",
      password_confirmation: 'password'
    )
    @user.save
    user = User.authenticate_with_credentials('email@email.com', 'password')
    expect(user).not_to be(nil)
   
  end
  it 'Should not pass with invalid credential' do  
    @user = User.new(
      first_name: "first_name",
      last_name: "last_name",
      email: "email@email.com",
      password: "password",
      password_confirmation: 'password'
    )
    @user.save
    user = User.authenticate_with_credentials('email@email.com', 'pass')
    expect(user).to be(nil)
   
  end
  it 'Should pass even if spaces are present in email' do  
    @user = User.new(
      first_name: "first_name",
      last_name: "last_name",
      email: "email@email.com",
      password: "password",
      password_confirmation: 'password'
    )
    @user.save
    user = User.authenticate_with_credentials(' email@email.com ', 'password')
    expect(user).not_to be(nil)
   
  end

  it 'Should pass even if wrong case is present for email' do  
    @user = User.new(
      first_name: "first_name",
      last_name: "last_name",
      email: "example@domain.com",
      password: "password",
      password_confirmation: 'password'
    )
    @user.save
    user = User.authenticate_with_credentials('eXample@domain.COM', 'password')
    expect(user).not_to be(nil)
   
  end

end


end
