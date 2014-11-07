::Conn = Mysql2::Client.new({
  :adapter=>"mysql2",
  :encoding=>"utf8",
  :reconnect=>false,
  :database=>"support",
  :pool=>5,
  :username=>"root",
  :password=>"root",
  :socket=>"/tmp/mysql.sock"
  })