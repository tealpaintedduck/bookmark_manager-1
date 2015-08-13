require 'spec_helper'
require './data_mapper_setup'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_in_as(user) }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, #{user.email}")
    expect(User.first.email).to eq(user.email)
  end

  context 'when filling in form' do
    scenario 'both email and password must have content' do
      visit '/users/new'
      click_button 'Sign up'
      expect(page).to have_content 'Please sign up'
    end

    scenario 'user not created when email left blank' do
      visit '/users/new'
      fill_in 'password', with: 'blahpassword'
      fill_in 'password_confirmation', with: 'blahpassword'
      click_button 'Sign up'
      expect(User.count).to eq 0
    end

    scenario 'requires a matching confirmation password' do
      expect { sign_up(:password_confirmation => 'wrong') }.not_to change(User, :count)
    end

    scenario 'with a password that does not match' do
      expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
      expect(current_path).to eq('/users')
      expect(page).to have_content 'Password does not match the confirmation'
    end

    scenario "I cannot sign up with an existing email" do
      user = build :user
      sign_in_as(user)
      expect { sign_in_as(user) }.to change(User, :count).by(0)
      expect(page).to have_content('Email is already taken')
    end
  end
end

feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!') # where does this message go?
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end

# def sign_in_as(user)
#   visit '/users/new'
#   fill_in :email, with: user.email
#   fill_in :password, with: user.password
#   fill_in :password_confirmation, with: user.password_confirmation
#   click_button 'Sign up'
# end

# def sign_up(email: 'alice@example.com',
#             password: '12345678',
#             password_confirmation: '12345678')
#   visit '/users/new'
#   fill_in :email, with: email
#   fill_in :password, with: password
#   fill_in :password_confirmation, with: password_confirmation
#   click_button 'Sign up'
# end

