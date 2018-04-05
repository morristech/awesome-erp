class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  rolify
  ## Callbacks
  after_create :assign_default_role
  ## Validations
  validates_presence_of :username
  def assign_default_role
    self.add_role(:worker) if self.roles.blank?
  end
end