class ApiController < ApplicationController
  respond_to :json
#TODO #TL this tunnels the api and the specific version
  def explore
    @json = doorkeeper_access_token.get("api/v1/#{params[:api]}").parsed
    respond_with @json
  end
end
