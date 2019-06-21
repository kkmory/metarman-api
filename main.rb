require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'metarman'

before do
  content_type :json
end

not_found do
  JSON.pretty_generate({body: nil, error: "not found"})
end

error do
  JSON.pretty_generate({body: nil, error: "something went wrong"})
end

get '/hc' do
  JSON.pretty_generate({body: 'server working!!', error: nil})
end

get '/*'  do |icao|
  err = []

  unless /[A-Z,a-z]{4}/ === icao
    err.push("invalid parameter. please enter correct ICAO airport code.")
  end

  data = Metarman.get_with_info(icao)
  # そもそもgem側でエラー投げてあげたほうがよさそう

  if err.empty?
    JSON.pretty_generate({body: data, error: nil})
  else
    JSON.pretty_generate({body: nil, error: err.first})
  end
end
