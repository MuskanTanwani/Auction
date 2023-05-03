require 'faraday'
class SearchService
  def practice
    @response = Faraday.get('http://127.0.0.1:3000/api/user')
    # byebug
    @p = JSON.parse(@response.body)
    render json: @p
  end 
end
