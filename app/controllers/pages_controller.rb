class PagesController < ApplicationController
  def home
    @title = "Home"
    if logged_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page],
                                               :per_page => 10)
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  
  def partners
    @title = "Partners"
  end
end
