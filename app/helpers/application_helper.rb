module ApplicationHelper
  def mark_active_tab(resource)
    " active" if active_tab?(resource)
  end

  private

  def active_tab?(resource)
    request.path.starts_with?(send("#{resource.to_s.pluralize}_path"))
  end
end
