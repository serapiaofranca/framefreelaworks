require 'rails_helper'

RSpec.describe Manager, type: :model do
  describe 'associations' do
    it { should have_many(:projects).class_name('Project') }
  end  
  
end
