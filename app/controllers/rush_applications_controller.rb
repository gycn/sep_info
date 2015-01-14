class RushApplicationsController < ApplicationController
  def new
    @application = Application.new
  end

  def show
    @application = Application.find_by user_id: current_user.id
  end

  def update
    @application = Application.find_by user_id: current_user.id
  end

  def edit
    @application = Application.find_by user_id: current_user.id
  end
end
