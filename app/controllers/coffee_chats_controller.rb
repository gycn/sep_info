class CoffeeChatsController < ApplicationController
  before_action :set_coffee_chat, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter do 
    redirect_to authenticated_root_path unless current_user && current_user.admin?
  end

  # GET /coffee_chats
  # GET /coffee_chats.json
  def index
    redirect_to action: "new"
  end

  # GET /coffee_chats/new
  def new
    @coffee_chat = CoffeeChat.new
    @user_list = []
    Application.all.each do |app|
      if app.submitted and !app.user.is_admin? and !app.user.is_brother?
        @user_list << [app.name,app.id]
      end
    end
  end

  # POST /coffee_chats
  # POST /coffee_chats.json
  def create
    @coffee_chat = CoffeeChat.new(coffee_chat_params)

    if @coffee_chat.save
      flash[:notice] = 'Successfully submitted form.'
      redirect_to authenticated_root_path
    else
      flash[:failure] = 'Failed to submit form.'
      redirect_to authenticated_root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_chat
      @coffee_chat = CoffeeChat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coffee_chat_params
      params.require(:coffee_chat).permit(:application_id,:interviewer_1,:interviewer_2,:overall,:empathy,:grit,:curiosity,:analytical,:comments)
    end
end
