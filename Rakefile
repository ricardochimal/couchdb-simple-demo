task :environment do
	require File.dirname(__FILE__) + '/lib/all'
end

require 'benchmark'
namespace :bench do
	task :write => :environment do
		puts Benchmark.realtime {
			100.times { |x| c = Counting.new; c.num = x; c.save; }
		}
	end

	task :destroyplus => :environment do
		puts Benchmark.realtime {
			100.times { |x| Counting.first.destroy }
		}
	end
end
