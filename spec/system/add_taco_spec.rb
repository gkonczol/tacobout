# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'adding a taco', type: :system do
  it 'allows a user to create a cheesy chicken taco with a soft shell' do
    visit new_taco_path
    fill_in 'Name', with: "Cheesy Chicken Taco"
    check('taco_soft_checked')
    click_on("Create Taco")
    visit tacos_path
    @taco = Taco.find_by(name: "Cheesy Chicken Taco")
    expect(page).to have_selector(
      "#taco_#{@taco.id} .name", text: "Cheesy Chicken Taco")
    expect(page).to have_selector(
      "#taco_#{@taco.id} .shell", text: "soft")
  end
end
