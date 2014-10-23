schedule_file = 'config/schedule.yml'

begin
  redis = Sidekiq.redis { |conn| conn.info }
rescue Redis::CannotConnectError
  redis = nil
end

if File.exists?(schedule_file) && redis.present?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
