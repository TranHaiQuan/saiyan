REDIS_CONFIG = YAML.load_file(::Rails.root.join "config/database.yml")
REDIS_SERVER = REDIS_CONFIG[::Rails.env["redis"]]
Rails.application.config.session_store :redis_store, servers: REDIS_SERVER,
  expires_in: 1.day, domain: :all, tld_length: 2, secure: Rails.env.production?
