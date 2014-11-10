Given /^I am not logged in$/ do 
  @current_user = nil
end

Given(/^I am logged in as "([^"]*)"$/) do |name|
  @current_user = Moviegoer.create!(:name => name)
  log_in
end

private
def log_in
  cookie_jar = Capybara.current_session.driver.browser.current_session.
                 instance_variable_get(:@rack_mock_session).cookie_jar
  cookie_jar[:stub_user_id] = @current_user.id
end

Then /^I should have "(.*)" button$/ do |name|
  should have_button name
end
