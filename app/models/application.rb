class Application < ActiveRecord::Base

  def create
    @application = Application.new(application_params)
    if @application.save
      return true
    end
    return false
  end
  serialize :availabilities

  ## S3 Credentials Redacted for Github.
   has_attached_file :picture,
     :storage => :s3,
     :bucket => 'theta-application-pictures',
     :s3_host_name => 's3-us-west-2.amazonaws.com'
   has_attached_file :resume,
     :storage => :s3,
     :bucket => 'theta-application-resumes',
     :s3_host_name => 's3-us-west-2.amazonaws.com'

     validates_attachment :resume, content_type: { content_type: ["application/pdf"] }

     validates_attachment :picture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
     belongs_to :user

    private

    def application_params
      params.require(:application).permit(:name, :email, :phone_number, :year, :major, :picture, :resume, :extracurriculars, :hobbies, :why_sep, :short_answer1, :short_answer2, :short_answer3, :short_answer4, :reference, :availabilities, :submitted)
    end
end

