require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  it { should belong_to :user }
end
