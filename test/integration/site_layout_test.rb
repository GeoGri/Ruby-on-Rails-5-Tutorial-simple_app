require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
   test "loyout links" do

     get root_path
     assert_template 'static_pages/home'
     assert_select "title", full_title
     assert_select "a[href=?]", root_path,    count: 2
     assert_select "a[href=?]", help_path,    text: "Help"
     assert_select "a[href=?]", about_path,   text: "About"
     assert_select "a[href=?]", contact_path, text: "Contact"
     assert_select "a[href=?]", signup_path,  text: "Log in"
     
     get help_path
     assert_template 'static_pages/help'
     assert_select "title", full_title("Help")

     get about_path
     assert_template 'static_pages/about'
     assert_select "title", full_title("About")

     get contact_path
     assert_template 'static_pages/contact'
     assert_select "title", full_title("Contact")

     get signup_path
     assert_template 'users/new'
     assert_select "title", full_title('Sign up')
 	end
end
