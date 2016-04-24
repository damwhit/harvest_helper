class EdamamService
  def initialize
    @_connection = Faraday.new(url: 'https://api.edamam.com')
  end

  def all(recipe_search)
    parse(connection.get '/search', { q: recipe_search, app_id: app_id, app_key: app_key })
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
