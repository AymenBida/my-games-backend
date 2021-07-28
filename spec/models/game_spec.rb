require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should have_many(:favourites) }
  it { should validate_presence_of(:title) }
end
