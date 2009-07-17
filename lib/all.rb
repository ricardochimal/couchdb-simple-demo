require 'couchrest'

def db
	@db ||= CouchRest.database!(ENV['COUCHDB_URL'])
end

$LOAD_PATH.unshift << File.dirname(__FILE__)

require 'access_log'
require 'counting'

