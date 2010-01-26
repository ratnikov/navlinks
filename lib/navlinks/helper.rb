# Methods added to this helper will be available to all templates in the application.
module Navlinks::Helper
  attr_accessor :nav_area

  def nav_link_to area, path, options = nil
    label = translate(area, :scope => 'navigation', :default => area.to_s)
    current_label = translate([ area, 'current' ].join('_'), :scope => 'navigation', :default => label)

    if nav_area == area
      link_to(decorate_current(current_label), path, :class => 'current')
    else
      link_to(label, path)
    end
  end

  private

  def decorate_current( current_label )
    "[ #{current_label} ]"
  end
end
