module GeneralHelper

  def current_item_id
    @current_item_id ||= (request.env['PATH_INFO'].split('/')[-1] || Page.root_page.to_param).to_i
  end

end
