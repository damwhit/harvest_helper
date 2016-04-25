class FrostDate
  attr_reader :spring,
              :fall

  def initialize(data)
    @spring = Date.parse(data[:spring]).strftime('%b %d')
    @fall = Date.parse(data[:fall]).strftime('%b %d')
  end

  def self.service
    FarmSenseService.new
  end

  def self.find(lat, lon)
    FrostDate.new(service.get_stations(lat, lon))
  end
end
