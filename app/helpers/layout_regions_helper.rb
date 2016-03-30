module LayoutRegionsHelper

  def layout_region_get_content_for(region_name)
    @layout_regions ||= LayoutRegion.all
    evaluate(@layout_regions.find{|region| region.name == region_name}.try(:content).try(:html_safe))
  end

end
