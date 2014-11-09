class NavTreesController < ApplicationController
  def show
    render json: StewardKpi.to_nav_tree
  end
end
