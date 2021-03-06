module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Venator Ventures"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("vv-logo-v1.png", :alt => "Venator Ventures", :class => "round")
  end
end
