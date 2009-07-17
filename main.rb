require 'rubygems'
require 'sinatra'

require File.dirname(__FILE__) + '/lib/all'

before do
	AccessLog.create_from_request(request)
end

get '/' do
	"Hello, I've been seen #{AccessLog.count} times. <a href=\"/latest\">View Latest Hits</a>"
end

get '/env' do
	request.env.collect { |k, v| "#{k} = #{v.inspect}" }.join("<br />\n")
end

get '/latest' do
	@logs = AccessLog.all(:limit => 20)
	erb :latest
end
