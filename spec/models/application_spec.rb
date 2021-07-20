require 'rails_helper'

RSpec.describe Application do
  describe 'has relationships' do
    it { should have_many :application_pets }
    it { should have_many(:pets).through(:application_pets) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:street_address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip_code) }
    it { should validate_presence_of(:applicant_story) }
    it { should validate_presence_of(:application_status) }
  end
end