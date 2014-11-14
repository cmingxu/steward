SUPPORT_DB_CONFIG = YAML.load_file("#{Rails.root}/config/support_db.yml")[Rails.env]

::Conn = Mysql2::Client.new(SUPPORT_DB_CONFIG)