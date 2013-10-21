worker_processes 1
working_directory "/var/www/globo/"

preload_app true

timeout 30

listen "/var/www/globo/tmp/sockets/unicorn.sock", :backlog => 64

pid "/var/www/globo/tmp/pids/unicorn.pid"

stderr_path "/var/www/globo/log/unicorn.stderr.log"
stdout_path "/var/www/globo/log/unicorn.stdout.log"

before_fork do |server, worker|
	defined?(ActiveRecord::Base) and
			ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
	defined?(ActiveRecord::Base) and
			ActiveRecord::Base.establish_connection
end