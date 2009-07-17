class Counting < CouchRest::ExtendedDocument
	use_database db

	property :num

	timestamps!
end
