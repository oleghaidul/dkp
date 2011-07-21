module ApplicationHelper

  def title
    default_title = "TAP"
    if @title.nil?
      default_title
    else
      "#{default_title} | #{@title}"
    end
  end

  def logo
    image_tag("logo3.jpg", :size => '710x180', :class => "round")
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def auth
     if user_signed_in?
     if current_user.email == "ususus1@yandex.ru"
        return true
     end
     end
  end

end
