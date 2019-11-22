class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # after_validation :set_default_role
  # before_save :set_default_role

  devise :database_authenticatable, :registerable, :validatable
  has_many :notes
  has_many :viewers
  has_many :readable, through: :viewers, source: :note

  

  enum role: [:user, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?
  private

  def set_default_role
    self.role ||= :user
  end
end
