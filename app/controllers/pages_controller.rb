class PagesController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped
  skip_before_action :authenticate_user!

  def home
    @boats = Boat.first(3)
  end
end
