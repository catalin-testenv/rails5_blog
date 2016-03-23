module LayoutRegionsHelper

  def get_content_for(region)
    evaluate(LayoutRegion.find_by(name: region).try(:content).try(:html_safe))
  end

end
