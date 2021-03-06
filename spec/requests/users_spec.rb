require 'spec_helper'

describe User do
  
  describe "register" do
    
    describe "failure" do
      
      it "should not make a new user" do
        lambda do
          visit register_path
          fill_in "Name",           :with => ""
          fill_in "Email",          :with => ""
          fill_in "Password",       :with => ""
          fill_in "Confirmation",   :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end
      
      it "should make a new user" do
        lambda do
          visit register_path
          fill_in "Name",           :with => "Example User"
          fill_in "Email",          :with => "user@example.com"
          fill_in "Password",       :with => "foobar"
          fill_in "Confirmation",   :with => "foobar"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "Welcome")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end
  end
  
  describe "log in/out" do
    
    describe "failure" do
      it "should not log a user in" do
        visit login_path
        fill_in "Email",          :with => ""
        fill_in "Password",       :with => ""
        click_button
        response.should have_selector("div.flash.error", :content => "Invalid")
      end
    end
    
    describe "success" do
      it "should log a user in and out" do
        user = Factory(:user)
        visit login_path
        fill_in :email,           :with => user.email
        fill_in :password,        :with => user.password
        click_button
        controller.should be_logged_in
        click_link "Log Out"
        controller.should_not be_logged_in
      end
    end
  end
end