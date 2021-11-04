require 'rails_helper'

RSpec.describe Developer, type: :model do
  describe 'associations' do
    it { should have_one(:profile).class_name('Profile') }
    it { should have_many(:proposals).class_name('Proposal') }
  end  
end
