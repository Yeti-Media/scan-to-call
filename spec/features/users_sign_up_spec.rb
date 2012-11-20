feature "users sign up" do

  background do
    User.create!(email: 'guille@google.com', password: '123456')
  end

  scenario "user login with valid information" do
    visit '/login'

    fill_in "email", with: "guille@google.com"
    fill_in "password", with: "123456"
    click_button "Log In"

    expect(page).to have_text("Logged in!")
  end

  scenario "user try to login with wrong information" do
    visit '/login'

    fill_in "email", with: "guille@google.com"
    fill_in "password", with: "1"
    click_button "Log In"

    expect(page).to have_text("Email or password is invalid")
  end
end
