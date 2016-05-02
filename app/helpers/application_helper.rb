module ApplicationHelper
  def embedded_svg(filename, options={})
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

  def devise_mapping
    Devise.mappings[:user]
  end

  def namespace_name
    params[:controller].match(/(?<namespace>.*)\//).try(:[],"namespace")
  end

  def admin_namespace?
    namespace_name == "admin"
  end

  def resource_name
    devise_mapping.name
  end

  def resource_class
    devise_mapping.to
  end

end
