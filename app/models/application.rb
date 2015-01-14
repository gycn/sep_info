class Application < ActiveRecord::Base

  def create
    @application = Application.new(application_params)
    if @application.save
      return true
    end
    return false
  end
  serialize :availabilities
   has_attached_file :picture,
     :storage => :s3,
     :bucket => 'eta-application-pictures',
     :s3_credentials => {
       :access_key_id => 'AKIAIU3E3KVTSWAVBOCA',
       :secret_access_key => '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'

     }
   has_attached_file :resume,
     :storage => :s3,
     :bucket => 'eta-application-resumes',
     :s3_credentials => {
       :access_key_id => 'AKIAIU3E3KVTSWAVBOCA',
       :secret_access_key =>'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'
     }

     belongs_to :user

#   validates :name, :email, :phone_number, :year, :major, :picture, :resume, :extracurriculars, :hobbies, :why_sep, :reference,  presence: true
    private

    def application_params
      params.require(:application).permit(:name, :email, :phone_number, :year, :major, :picture, :resume, :extracurriculars, :hobbies, :why_sep, :short_answer1, :short_answer2, :short_answer3, :short_answer4, :reference, :availabilities)
    end
end

