module ApiHelpers
  def json_body
    JSON.parse(response.body, symbolize_names: true)
  end
end

RSpec.configure do |config|
  config.include ApiHelpers, type: :request
end
