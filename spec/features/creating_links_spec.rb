require 'spec_helper'
require './data_mapper_setup'

feature 'creating new links' do
  scenario 'can create a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.zombo.com'
    fill_in 'title', with: 'This is Zombocom'
    click_button 'Create link'
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('This is Zombocom')
    end
  end
end