Given('I visit registration page') do
  visit new_user_registration_path
end

Given('I am logged in as {string}') do |user_email|
  user = User.find_by(email: user_email)
  login_as(user, scope: :user)
end

Then('a family should have been created in the database') do
  family = Family.last
  expect(family).not_to be nil
end

Then('I should see {string} and {string}') do |content, user_email|
  User.find_by(email: user_email)
  expect(page).to have_content content
end
