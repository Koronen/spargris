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
    klass.model_name.human.pluralize
  end
  def show_title(resource)
    if resource.has_attribute? :name
      "#{resource.class.model_name.human}: #{resource.name}"
    else
      "#{resource.class.model_name.human} ##{resource.id}"
    end
  end
  def new_title(resource)
    t('helpers.submit.create', :model => resource.class.model_name.human.downcase)
  end
  def edit_title(resource)
    edit_text = t('helpers.submit.update', :model => resource.class.model_name.human.downcase)
    if resource.has_attribute? :name
      "#{edit_text}: #{resource.name}"
    else
      "#{edit_text} ##{resource.id}"
    end
  end

  def modification_image_links(resource)
    output = []
    singular_table_name = resource.class.table_name.singularize
    singular_human_name = resource.class.model_name.human.downcase
    output << link_to(image_tag("icons/zoom.png", :alt => "Show #{singular_human_name}", :title => "Show #{singular_human_name}"), resource)
    output << link_to(image_tag("icons/wrench.png", :alt => "Edit #{singular_human_name}", :title => "Edit #{singular_human_name}"), method("edit_#{singular_table_name}_path").call(resource))
    output << link_to(image_tag("icons/page_copy.png", :alt => "Clone #{singular_human_name}", :title => "Clone #{singular_human_name}"), method("new_#{singular_table_name}_path").call(:template => resource))
    output << link_to(image_tag("icons/delete.png", :alt => "Delete #{singular_human_name}", :title => "Delete #{singular_human_name}"), resource, :confirm => 'Are you sure?', :method => :delete)
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
