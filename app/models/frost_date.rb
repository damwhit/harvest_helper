class FrostDate
  attr_reader :spring,
              :fall

  def initialize(data)
    @spring = format_spring(data)
    @fall = format_fall(data)
  end

  def self.service
    FarmSenseService.new
  end

  def self.find(lat, lon)
    FrostDate.new(service.get_stations(lat, lon))
  end

  def format_spring(data)
    return "It's too warm to frost there!" if data[:spring] == "0000"
    Date.parse(data[:spring]).strftime('%b %d')
  end

  def format_fall(data)
    return "It's too warm to frost there!" if data[:fall] == "0000"
    Date.parse(data[:fall]).strftime('%b %d')
  end
end
