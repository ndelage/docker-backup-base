set :output, "/root/cron.log"
# Get the environment variables from /etc/container_environment.sh
set :job_template, "bash -l -c 'source /etc/container_environment.sh ; :job'"

every :hour do
  command "/usr/local/bin/backup perform -t portraits_db"
end
