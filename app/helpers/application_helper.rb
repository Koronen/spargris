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
    if resource.has_attribute? :name
      "#{resource.class.human_name}: #{resource.name}"
    else
      "#{resource.class.human_name} ##{resource.id}"
    end
  end
  def new_title(resource)
    t('helpers.submit.create', :model => resource.class.human_name.downcase)
  end
  def edit_title(resource)
    edit_text = t('helpers.submit.update', :model => resource.class.human_name.downcase)
    if resource.has_attribute? :name
      "#{edit_text}: #{resource.name}"
    else
      "#{edit_text} ##{resource.id}"
    end
  end

  def modification_image_links(resource)
    output = []
    singular_class_name = resource.class.name.downcase
    output << link_to(image_tag("icons/zoom.png", :alt => "Show #{singular_class_name}", :title => "Show #{singular_class_name}"), resource)
    output << link_to(image_tag("icons/wrench.png", :alt => "Edit #{singular_class_name}", :title => "Edit #{singular_class_name}"), method("edit_#{singular_class_name}_path").call(resource))
    output << link_to(image_tag("icons/page_copy.png", :alt => "Clone #{singular_class_name}", :title => "Clone #{singular_class_name}"), method("new_#{singular_class_name}_path").call(:template => resource))
    output << link_to(image_tag("icons/delete.png", :alt => "Delete #{singular_class_name}", :title => "Delete #{singular_class_name}"), resource, :confirm => 'Are you sure?', :method => :delete)
    output.join(" ").html_safe
  end

  def mark_active_tab(resource)
    " active" if active_tab?(resource)
  end

  private

  def active_tab?(resource)
    request.path.starts_with?(send("#{resource.to_s.pluralize}_path"))
  end
end
