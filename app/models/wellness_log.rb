class WellnessLog < ApplicationRecord
  # Direct associations

  has_many   :food_logs,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
