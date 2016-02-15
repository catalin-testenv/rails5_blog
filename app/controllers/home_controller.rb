class HomeController < ApplicationController

  # GET /
  def home
    skip_authorization
    skip_policy_scope
  end

end
