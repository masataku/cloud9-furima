module SignInSupport
  def sign_in(user)
    visit root_path
    expect(page).to have_content("ログイン")
    find_link("ログイン", href: users_login_path).click
    expect(current_path).to eq users_login_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    expect{find('input[name="commit"]').click}.to change {User.count}.by(0)
    expect(current_path).to eq user_path(user)
    expect(page).to have_content("ログインしました")
  end  
end
