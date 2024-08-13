require 'resque'
require 'resque/scheduler'
require 'resque/scheduler/server'

Resque.redis = Redis.new(host: 'localhost', port: 6379)
Resque.schedule = YAML.load_file(Rails.root.join('config', 'schedule.yml'))