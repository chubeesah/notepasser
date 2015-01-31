require 'httparty'
require 'pry'

class NotePasser
  include HTTParty
  base_uri 'http://10.0.0.84:3301'

  def create_user(opts)
    opts = {:name => /\A([a-zA-Z]*\w)\z/}
    #:user_name => /\A([a-zA-Z]*\w\d)\z/, :password => /\A([a-zA-Z]*\w\d\s)\z/
    options = {:body => opts.to_json}
    result = self.class.post("/users", options)
    JSON.parse(result.body)
  end

  def get_user(name)
    result = self.class.get("/users/#{name}")
    JSON.parse(result.body)