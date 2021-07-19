require 'rails_helper'

RSpec.describe ApplicationPet do
  describe 'has relationships' do
    it { should belong_to :pet }
    it { should belong_to :application }
  end
end
