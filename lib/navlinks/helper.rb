# Methods added to this helper will be available to all templates in the application.
module Navlinks
  module Helper
    attr_accessor :nav_area

    def nav_link_to(area, path, options = nil)
      link_to(nav_label_for(area), path, :class => (nav_current?(area) ? 'current' : nil))
    end

    private

    def nav_current?(area)
      nav_area == area
    end

    def nav_label_for(area)
      label = translate(area, :scope => 'navigation', :default => area.to_s)

      if nav_current?(area)
	translate([ area, 'current' ].join('_'), :scope => 'navigation', :default => label)
      else
	label
      end
    end
  end
end
