class AccessLog < CouchRest::ExtendedDocument
	use_database db

	property :method
	property :host
	property :uri
	property :ip
	property :user_agent

	timestamps!

	save_callback :before, :format_ip

	def format_ip
		self.ip = self.ip.split(",").first.strip
	end

	def self.create_from_request(request)
		log = AccessLog.new
		log.ip = request.env['REMOTE_ADDR']
		log.method = request.env['REQUEST_METHOD']
		log.host = request.env['HTTP_HOST']
		log.uri = request.env['REQUEST_URI']
		log.user_agent = request.env['HTTP_USER_AGENT']
		log.save
		log
	end
end
