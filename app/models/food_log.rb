class FoodLog < ApplicationRecord
  # Direct associations

  belongs_to :wellness_log

  belongs_to :user

  # Indirect associations

  # Validations

end
