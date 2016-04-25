class FarmSenseService
  def initialize
    @_connection = Faraday.new(url: "http://farmsense-prod.apigee.net/v1/frostdates/")
  end

  def get_stations(lat, lon)
    id = parse(connection.get "stations/", {lat: lat, lon: lon}).first[:id]
    get_frosts(id)
  end

  def get_frosts(id)
    # both fall and spring frosts are based on threshold of 32 degrees and 50% probability
    spring_frost_date = parse(connection.get "probabilities/", {station: id, season: 1})[1][:prob_50]
    fall_frost_date = parse(connection.get "probabilities/", {station: id, season: 2})[1][:prob_50]
    return { spring: spring_frost_date, fall: fall_frost_date }
  end

  private
    def connection
      @_connection
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
