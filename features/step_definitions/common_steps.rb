Given /^I am logged into the site$/ do
  user = Factory(:user)

  session["warden.user.user.key"] = User.serialize_into_session(user)
end

