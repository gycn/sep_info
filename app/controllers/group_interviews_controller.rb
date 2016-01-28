class GroupInterviewsController < ApplicationController
  before_action :set_group_interview, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter do 
    redirect_to authenticated_root_path unless current_user && current_user.admin?
  end

  # GET /group_interviews
  # GET /group_interviews.json
  def index
    redirect_to action: "new"
  end
  
  # GET /group_interviews/new
  def new
    @group_interview = GroupInterview.new
    @user_list = []
    Application.all.each do |app|
      if app.submitted and !app.user.is_admin? and !app.user.is_brother?
        @user_list << [app.name,app.id]
      end
    end
  end

  # POST /group_interviews
  # POST /group_interviews.json
  def create
    @group_interview = GroupInterview.new(group_interview_params)

    
    if @group_interview.save
      flash[:notice] = 'Successfully submitted form.'
      redirect_to authenticated_root_path
    else
      flash[:failure] = 'Failed to submit form.'
      redirect_to authenticated_root_path
    end
        
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_interview
      @group_interview = GroupInterview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_interview_params
      params.require(:group_interview).permit(:author,:score,:comments,:application_id)
    end
end
