require 'rails_helper'

RSpec.describe 'Search for taco shop', type: :system do
  it 'allows a user to search for a local taco shop' do
    visit search_page
    fill_in 'Search', with: 'Spicy Goddamn Tacos'
    fill_in 'Radius', with: '50 mi.'
    click_on('Begin Search')
    visit search_results
    expect(page).to have_content('Spicy Goddamn Tacos')
    expect(page).to have_content('Rating 4.5')
  end
end
