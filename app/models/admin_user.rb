class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  after_initialize do
    self.permissions ||= {}
  end

  def can?(module_name, action)
    permissions.dig(module_name.to_s)&.include?(action.to_s)
  end
end
