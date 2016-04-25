class EdamamService
  def initialize
    @_connection = Faraday.new(url: 'https://api.edamam.com')
  end

  def all(plant)
    parse(connection.get '/search', { q: plant, app_id: app_id, app_key: app_key })
  end

  def find(id)
    parse(connection.get '/search', { r: id, app_id: app_id, app_key: app_key })
  end

  private
    def connection
      @_connection
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def app_id
      ENV['EDAMAM_ID']
    end

    def app_key
      ENV['EDAMAM_KEY']
    end
end
