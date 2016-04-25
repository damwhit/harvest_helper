require 'rails_helper'

RSpec.describe Station, type: :model do
  it { should validate_presence_of(:address) }
end
