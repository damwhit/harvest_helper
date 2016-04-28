class ApiKey < ActiveRecord::Base
  belongs_to :user
  before_create :generate_access_token

  private
    def generate_access_token
      begin
        self.api_key = SecureRandom.hex
      end while self.class.exists?(api_key: api_key)
    end
end
