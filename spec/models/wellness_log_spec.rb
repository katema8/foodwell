require 'rails_helper'

RSpec.describe WellnessLog, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:food_logs) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
