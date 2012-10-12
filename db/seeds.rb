# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = User.create! :email => "user@example.com", :password => "doorkeeper", :password_confirmation => "doorkeeper"
require 'rest-client'
require 'json'

client_id = 'my_client_id...'
client_secret = 'my_client_secret...'

response = RestClient.post 'http://localhost:3000/oauth/token', {
  grant_type: 'client_credentials',
  client_id: client_id,
  client_secret: client_secret
}
token = JSON.parse(response)["access_token"]

# this line works great:
RestClient.get 'http://localhost:3000/api/v1/flights.json', { 'Authorization' => "Bearer #{token}" }
# this line always fails (401 Unauthorized):
RestClient.post 'http://localhost:3000/api/v1/flights.json', { 'Authorization' => "Bearer #{token}" }