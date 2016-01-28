class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :application

  after_create do |record|
    Application.create(:user_id => record.id, :name => record.name, :email => record.email)
  end

  def is_admin?
    self.admin == true
  end

  def is_brother?
    self.brother == true
  end

end
