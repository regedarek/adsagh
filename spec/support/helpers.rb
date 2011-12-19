def log_in(admin)
    visit '/zaloguj'
    fill_in 'username', :with => admin.username
    fill_in 'password', :with => "z"
    click_button('Zaloguj')
end

def page!
  save_and_open_page
end