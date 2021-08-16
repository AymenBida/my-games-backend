require 'rails_helper'

RSpec.describe Game, type: :model do
  context 'associations' do
    it { should have_many(:favourites) }
  end

  context 'validations' do
    it { should validate_presence_of(:title) }
  end
end
