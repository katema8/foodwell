class User < ApplicationRecord
  # Direct associations

  has_many   :wellness_logs,
             :dependent => :destroy

  has_many   :food_logs,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
