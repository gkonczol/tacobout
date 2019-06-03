# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'adding a user', type: :system do
  it 'allows a user to sign up by providing a username, password and email' do
    visit new_user_path
    fill_in 'Username', with: "eatsTacos69"
    fill_in 'Password', with: "passcode1234"
    fill_in 'Email', with: "example@my.com"
    click_on('Create User')
    visit users_path
    @user = User.find_by(username: "eatsTacos69")
    expect(page).to have_content("eatsTacos69")
    expect(page).to have_content("passcode1234")
    expect(page).to have_content("example@my.com")
    visit user_path(@user)
    expect(page).to have_content("eatsTacos69")
    expect(page).to have_content("example@my.com")
  end
end