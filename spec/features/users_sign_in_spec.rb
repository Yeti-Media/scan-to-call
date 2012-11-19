feature "users sign in" do
  scenario "user register with valid information" do
    visit '/'

    fill_in "user_email", with: "guille@google.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"

    expect(page).to have_text("User was successfully created.")
  end

  scenario "user try to register with missing information" do
    visit '/'

    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"

    expect(page).to have_text("Email can't be blank")
  end
end
