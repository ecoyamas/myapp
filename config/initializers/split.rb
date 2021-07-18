config_file = Rails.root.join('config', 'split.yml')
Split.redis = YAML.load_file(config_file)[Rails.env] if File.exist? config_file

Split.configure do |config|
  config.db_failover = true # handle Redis errors gracefully 
  config.db_failover_on_db_error = ->(error) { Rails.logger.error(error.message) } 
  config.allow_multiple_experiments = true 
  config.enabled = !Rails.env.test? 
  config.persistence = Split::Persistence::RedisAdapter.with_config( 
    lookup_by: ->(context) { context.session_user.uid },
    expire_seconds: 2592000 # 30日 
  ) 
  config.include_rails_helper = true
end
