# set path to app that will be used to configure unicorn,
# note the trailing slash in this example
@dir = "/usr/src/app/"

worker_processes 2
working_directory @dir

timeout 30

# Specify path to socket unicorn listens to,
# we will use this in our nginx.conf later
listen "/tmp/sockets/unicorn.sock", :backlog => 64

# Set process id path
pid "/var/run/unicorn.pid"

# Set log file paths
stderr_path "/dev/stderr"
stdout_path "/dev/stdout"
