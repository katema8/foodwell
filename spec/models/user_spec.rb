require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:wellness_logs) }

    it { should have_many(:food_logs) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
