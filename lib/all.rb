require 'couchrest'

def db
	@db ||= CouchRest.database!(ENV['COUCHDB_URL'])
end

require File.dirname(__FILE__) + '/access_log'

