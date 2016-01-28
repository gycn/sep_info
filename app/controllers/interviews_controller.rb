class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter do 
    redirect_to authenticated_root_path unless current_user && current_user.admin?
  end

  # GET /interviews
  # GET /interviews.json
  def index
    redirect_to action: "new"
  end
  
  # GET /interviews/new
  def new
    @interview = Interview.new
    @user_list = []
    Application.all.each do |app|
      if app.submitted and !app.user.is_admin? and !app.user.is_brother?
        @user_list << [app.name,app.id]
      end
    end
  end

  # POST /interviews
  # POST /interviews.json
  def create
    @interview = Interview.new(interview_params)

    if @interview.save
      flash[:notice] = 'Successfully submitted form.'
      redirect_to authenticated_root_path
    else
      flash[:failure] = 'Failed to submit form.'
      redirect_to authenticated_root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_params
      params.require(:interview).permit(:application_id,:interviewer_1,:score_1,:notes_1,:interviewer_2,:score_2,:notes_2,:interviewer_3,:score_3,:notes_3)
    end
end
