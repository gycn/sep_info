class Application < ActiveRecord::Base

  def create
    @application = Application.new(application_params)
    if @application.save
      return true
    end
    return false
  end


  has_attached_file :picture,
     :storage => :s3,
     :bucket => 'iota-application-pictures',
     :s3_host_name => 's3-us-west-2.amazonaws.com',
     :s3_credentials => {
       :access_key_id => 'AKIAIVCEK3GCSMVQAFOQ',
       :secret_access_key => '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'
     }
  has_attached_file :resume,
     :storage => :s3,
     :bucket => 'iota-application-resumes',
     :s3_host_name => 's3-us-west-2.amazonaws.com',
     :s3_credentials => {
       :access_key_id => 'AKIAIVCEK3GCSMVQAFOQ',
       :secret_access_key => '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'
     }


     validates_attachment :resume, content_type: { content_type: ["application/pdf"] }

     validates_attachment :picture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
     belongs_to :user

    private

    def application_params
      params.require(:application).permit(:name, :email, :phone_number, :year, :major, :picture, :resume, :extracurriculars, :hobbies, :why_sep, :short_answer1, :short_answer2, :short_answer3, :short_answer4, :reference, :submitted)
    end
end

