require 'dotenv'
require 'twitter'
require 'pry'
require 'twitter-ads'

Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_API_RANDOM"]
  config.access_token_secret = ENV["TWITTER_API_RANDOM_SECRET"]
end

# Stream mentions of coffee
topics = ["coffee"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end
