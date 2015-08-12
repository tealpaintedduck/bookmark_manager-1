
feature 'sign up as a new user' do
  scenario 'both email and password fields must have content' do
    visit '/users/new'
    click_button 'Sign up'
    expect(page).to have_content 'Please sign up' #look for a xpath expectation
  end

end