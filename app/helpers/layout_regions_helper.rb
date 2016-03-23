module LayoutRegionsHelper

  def get_content_for(region)
    LayoutRegion.find_by(name: region).try(:html_safe)
  end
  
end
