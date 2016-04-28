require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:oauth_token) }
  it { should validate_presence_of(:name) }
  it { should have_many :plants }
  it { should have_many :api_keys }
end
