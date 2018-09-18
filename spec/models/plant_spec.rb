require 'rails_helper'

RSpec.describe Plant, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:optimal_sun) }
  it { should validate_presence_of(:optimal_soil) }
  it { should validate_presence_of(:when_to_plant) }
  it { should validate_presence_of(:growing_from_seed) }
  it { should validate_presence_of(:transplanting) }
  it { should validate_presence_of(:spacing) }
  it { should belong_to :user }
end
