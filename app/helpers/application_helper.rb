module ApplicationHelper
  def build_title
    title = ""
    cf = content_for(:title)
    unless cf.empty?
      title += "#{cf} - "
    end
    title += "Spargris"
  end

  def index_title(klass)
    klass.human_name.pluralize
  end
  def show_title(resource)
    "#{resource.class.human_name} ##{resource.id}"
  end
  def new_title(resource)
    t('helpers.submit.create', :model => resource.class.human_name.downcase)
  end
  def edit_title(resource)
    t('helpers.submit.update', :model => resource.class.human_name.downcase) + " ##{resource.id}"
  end

  def mark_active_tab(resource)
    " active" if active_tab?(resource)
  end

  private

  def active_tab?(resource)
    request.path.starts_with?(send("#{resource.to_s.pluralize}_path"))
  end
end
