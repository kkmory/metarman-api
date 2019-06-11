require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'metarman'

get '/hc' do
  JSON.pretty_generate({body: 'server working!!', error: nil})
end

get '/*'  do |icao|
  err = []

  unless /[A-Z,a-z]{4}/ === icao
    err.push("invalid parameter. please enter correct ICAO airport code.")
  end

  data = Metarman.get_with_info(icao)
  if data == nil
    err.push("something went wrong")
  end

  # gem側でエラー投げてあげたほうがよさそう

  if err.nil?
    JSON.pretty_generate({body: nil, error: err.first})
  else
    JSON.pretty_generate({body: data, error: nil})
  end
end