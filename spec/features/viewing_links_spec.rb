require 'spec_helper'
require_relative '../../data_mapper_setup'

feature 'Viewing links' do
  scenario 'I can see existing links on the link page' do
    Link.new(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/links'
    expect(page.status_code).to eq 200 #checks that everything is working ok
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
