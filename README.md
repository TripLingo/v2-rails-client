# Dookreeper Devise+Omniauth Client

This app is an example of OAuth2 client. It was built in order to test
the [doorkeeper provider example](http://doorkeeper-provider.herokuapp.com/).
It uses [rails](http://github.com/rails/rails/), [devise](http://github.com/plataformatec/devise)
and [omniauth](http://github.com/intridea/omniauth) gems. OAuth2
strategy is build on top of [abstract OAuth2 strategy for OmniAuth](https://github.com/intridea/omniauth-oauth2)

## About Doorkeeper Gem

For more information [about the gem](https://github.com/applicake/doorkeeper),
[documentation](https://github.com/applicake/doorkeeper#readme),
[wiki](https://github.com/applicake/doorkeeper/wiki/_pages) and another resources,
check out the project [on GitHub](https://github.com/applicake/doorkeeper).

## Installation & Configuration

If you want to run the application by yourself here are the steps for
you.

First you need to clone the [repository from GitHub](http://github.com/applicake/doorkeeper-devise-client)

    git clone git://github.com/applicake/doorkeeper-devise-client.git

Install all the gems

    bundle install

And migrate the databse

    rake db:migrate

At this point the application should be ready to run, but it won't
communicate correctly with the provider. You need to set up environment
variables to indicate the oauth2 provider values. In your environemnt
file set up these variables

    DOORKEEPER_APP_ID = "375c2e3fd..." # ID for your app registered at the provider
    DOORKEEPER_APP_SECRET = "6a2fa82ab..." # Secret
    DOORKEEPER_APP_URL = "http://the-provider.com" # URL to the provider

If you want to test it out you can use our sample provider using
[doorkeeper](http://github.com/applicake/doorkeeper) gem. It's available
[here](http://doorkeeper-provider.herokuapp.com). In order to add your
application and get your appication ID and SECRET [click
here](http://doorkeeper-provider.herokuapp.com/oauth/application/new).

Add the client keys to tl-auth server:
>> clientapp.redirect_uri="http://localhost:3000/users/auth/doorkeeper/callback"
=> "http://localhost:3000/users/auth/doorkeeper/callback"
>> clientapp.uid="ff7615b1c539cbd8d533e247559ea34f675117eedcf1a2288cdba47ff2465313"
=> "ff7615b1c539cbd8d533e247559ea34f675117eedcf1a2288cdba47ff2465313"
>> clientapp.secret="b028aa00f72a1bf152baff3abf3e35e04869c3cad8bb7b5e6dc3fa2b5ef089e3"
=> "b028aa00f72a1bf152baff3abf3e35e04869c3cad8bb7b5e6dc3fa2b5ef089e3"
>> clientapp = Doorkeeper::Application.new
ow in set
>> clientapp.name="localhost3000"=> "localhost3000"
>> clientapp.save
   (0.1ms)  begin transaction
  Doorkeeper::Application Exists (0.2ms)  SELECT 1 AS one FROM "oauth_applications" WHERE ("oauth_applications"."uid" = '31aa0b0f8f37afe3681bd0265a8a37efa27c567e32d00d4436ff03f881dc077d' AND "oauth_applications"."id" != 1) LIMIT 1
   (0.5ms)  UPDATE "oauth_applications" SET "name" = 'localhost3000', "updated_at" = '2012-10-12 03:48:47.917293' WHERE "oauth_applications"."id" = 1
   (3.1ms)  commit transaction
  true 
   
Test it on the client using rest commands:   
    require 'rest-client'
    require 'json'
    client_id = DOORKEEPER_APP_ID
 => "ff7615b1c539cbd8d533e247559ea34f675117eedcf1a2288cdba47ff2465313" 
 client_secret = DOORKEEPER_APP_SECRET
 => "b028aa00f72a1bf152baff3abf3e35e04869c3cad8bb7b5e6dc3fa2b5ef089e3" 

 
response = RestClient.post 'http://localhost:4000/oauth/token', { grant_type: 'client_credentials', client_id: client_id, client_secret: client_secret}
 
 => "{\"access_token\":\"1bc58874a59b4f61c074f292b6bde501c09281f850dafb48ea20fed1e2bdce5f\",\"expires_in\":300,\"scope\":\"public\",\"token_type\":\"bearer\"}" 

token = JSON.parse(response)["access_token"]

 => "1bc58874a59b4f61c074f292b6bde501c09281f850dafb48ea20fed1e2bdce5f" 



1.9.3p194 :011 > RestClient.get 'http://localhost:4000/api/v1/profiles.json', { 'Authorization' => "Bearer #{token}" }
<!-- 
21:46:47 log.1  | Started GET "/api/v1/profiles.json" for 127.0.0.1 at 2012-10-09 21:46:47 -0400
21:46:47 log.1  | Processing by Api::V1::ProfilesController#index as JSON
21:46:47 log.1  |   Doorkeeper::AccessToken Load (0.2ms)  SELECT "oauth_access_tokens".* FROM "oauth_access_tokens" WHERE "oauth_access_tokens"."token" = '1bc58874a59b4f61c074f292b6bde501c09281f850dafb48ea20fed1e2bdce5f' LIMIT 1
21:46:47 log.1  | Filter chain halted as #<Proc:0x007fa2d9271ec8@/Users/jcowhigjr/.rvm/gems/ruby-1.9.3-p194/gems/doorkeeper-0.4.2/lib/doorkeeper/helpers/filter.rb:8> rendered or redirected
21:46:47 log.1  | Completed 401 Unauthorized in 1ms (ActiveRecord: 0.2ms) -->


