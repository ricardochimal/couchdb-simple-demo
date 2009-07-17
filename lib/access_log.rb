class AccessLog < CouchRest::ExtendedDocument
	use_database db

	property :method
	property :url
	property :ip

	timestamps!
end
