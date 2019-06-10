# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'adding a shop', type: :system do
  it 'allows a user to create a shop' do
    visit new_shop_path
    fill_in 'Name', with: "Crunchy Burrito"
    fill_in 'Address', with: "17217 Kent Rd"
    click_on("Create Shop")
    visit shops_path
    expect(page).to have_content("Crunchy Burrito")
    expect(page).to have_content("17217 Kent Rd")
  end
end