class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_picture

  def is_admin
    return self.role == "admin" ? true : false
  end

  def is_trainer
    return self.role == "trainer" ? true : false
  end

  def is_student
    return self.role == "student" ? true : false
  end

  def full_name
    return  "#{self.first_name} #{self.last_name}"
  end

end
