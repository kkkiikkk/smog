# frozen_string_literal: true

require 'resque'
require 'resque/scheduler'
require 'resque/scheduler/server'

host = ENV['REDIS_HOST'] || 'localhost'
port = ENV['REDIS_PORT'] || 6379

Resque.redis = Redis.new(host:, port:)
Resque.schedule = YAML.load_file(Rails.root.join('config', 'schedule.yml'))
