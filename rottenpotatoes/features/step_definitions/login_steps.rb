Given /^I am not logged in$/ do 
  page.session[:user_id] = nil
end
