require 'rails_helper'

RSpec.describe FoodLog, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:wellness_log) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
