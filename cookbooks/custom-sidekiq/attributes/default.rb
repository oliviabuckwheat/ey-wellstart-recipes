# More information on how to use this file to customize the Sidekiq cookbook is
# available in custom_sidekiq/README.md
#
# this is the default
# default['sidekiq']['is_sidekiq_instance'] = true

# run the recipe on a utility instance named background_workers
default['sidekiq']['is_sidekiq_instance'] = (node['dna']['instance_role'] == 'util' && node['dna']['name'] == 'es_red_bw')

# run the recipe on a solo instance
#default['sidekiq']['is_sidekiq_instance'] = (node['dna']['instance_role'] == 'solo')

# Default memory limit


# Number of workers (not threads)
default['sidekiq']['workers'] = 1

# Concurrency
default['sidekiq']['concurrency'] = 25

# Queues
default['sidekiq']['queues'] = {
  # :queue_name => priority
  :critical => 3,
  :default => 2,
  :mailers => 2,
  :low => 1,
}

# Memory limit
default['sidekiq']['worker_memory'] = 400 # MB

# Verbose
default['sidekiq']['verbose'] = false

# Setting this to true installs a cron job that
# regularly terminates sidekiq workers that aren't being monitored by monit,
# and terminates those workers
#
# default: false
default['sidekiq']['orphan_monitor_enabled'] = false

# sidekiq_orphan_monitor cron schedule
#
# default: every 5 minutes
default['sidekiq']['orphan_monitor_cron_schedule'] = "*/5 * * * *"
