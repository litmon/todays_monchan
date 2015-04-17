require 'sinatra'
require 'sinatra/reloader'
require 'slim'
require 'twitter'
require 'dotenv'
require 'json'
Dotenv.load

set :slim, format: :html

client = Twitter::REST::Client.new do |config|
  config.consumer_key    = ENV['TODAYS_MONCHAN_CONSUMER_KEY']
  config.consumer_secret = ENV['TODAYS_MONCHAN_CONSUMER_SECRET']
end

get '/' do
  @result = client.search("#今日のもんちゃん -rt", lang: "ja", result_type: :recent, count: 100)
  slim :index
end

get '/:query' do
  slim :index
end
