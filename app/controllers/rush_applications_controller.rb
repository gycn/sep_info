class RushApplicationsController < ApplicationController

  def index
    if !current_user.admin?
      redirect_to authenticated_root_path
    end
    @applications = Application.where(:submitted => true)
  end
  def new
    @application = Application.new
  end

  def show
    @application = Application.find_by user_id: params[:id]
  end

  def update
    @application = Application.find_by user_id: current_user.id

      if @application.update_attributes(application_params)
        if params[:subaction] == 'Submit'
          @application.submitted = true
          @application.save!
          redirect_to :back, :notice => "Successfully submitted!"
        else
          redirect_to :back, :notice => "Successfully saved!"
        end
      else
    end
  end

  def edit
    if current_user.admin?
      redirect_to rush_applications_path
    end
    @application = Application.find_by user_id: current_user.id
  end
    private

    def application_params
      params.require(:application).permit(:name, :email, :phone_number, :year, :major, :picture, :resume, :extracurriculars, :hobbies, :why_sep, :short_answer1, :short_answer2, :short_answer3, :short_answer4, :reference, {:availabilities => []})
    end

end
