module ApplicationHelper

  # [1, pg. 178]
  def page_title(current_page = '')
    title = "News Plus"
    if current_page.empty?
      title
    else
      current_page + " | " + title
    end
  end

  def navlink_class(path)
    if current_page?(path)
      "active"
    elsif current_page?(root_path) && path == home_path
      "active"
    else
      ""
    end
  end

end
 