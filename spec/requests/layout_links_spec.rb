require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  it "should have a Partners page at '/partners'" do
    get '/partners'
    response.should have_selector('title', :content => "Partners")
  end
  
  it "hsould have register page at '/register'" do
    get '/register'
    response.should have_selector('title', :content => "Register")
  end
end
