class Profile < ActiveRecord::Base
  belongs_to :user

  def name
  	return "#{first_name} #{last_name}"
  end
end
