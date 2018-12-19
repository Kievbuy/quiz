module ApplicationHelper

  def active?(path)
    "active" if current_page?(path)
  end

  def active_instance?(active)
    if active
      content_tag :span do
        fa_icon "check-circle", class: "green"
      end
    else
      content_tag :span do
        fa_icon "exclamation-circle", class: "red"
      end
    end
  end

end
