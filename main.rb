require 'rubygems'
require 'sinatra'

require File.dirname(__FILE__) + '/lib/all'

get '/' do
	"Hello, I've been seen by #{AccessLog.count} times"
end

get '/env' do
	request.env.collect { |k, v| "#{k} = #{v.inspect}" }.join("<br />\n")
end
