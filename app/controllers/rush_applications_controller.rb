class RushApplicationsController < ApplicationController
  def new
    @application = Application.new
  end

  def show
    @application = Application.find_by user_id: current_user.id
  end

  def update
    @application = Application.find_by user_id: current_user.id

    respond_to do |format|
      if @application.update_attributes(application_params)
        if application_params[:commit] == 'Submit Application'
          @application.submitted = true
          @application.save!
        end
        format.html {render nothing: true, :alert => "Successfully saved!"}
        format.js do
          render :js => "$('#flash').html('Successfully updated');"
        end
      else
        format.js do
          render :js => "$('#flash').html('Something went wrong, please double check your submission')"
        end
      end
    end
  end

  def edit
    @application = Application.find_by user_id: current_user.id
  end
    private

    def application_params
      params.require(:application).permit(:name, :email, :phone_number, :year, :major, :picture, :resume, :extracurriculars, :hobbies, :why_sep, :short_answer1, :short_answer2, :short_answer3, :short_answer4, :reference, {:availabilities => []}, :submitted)
    end

end
