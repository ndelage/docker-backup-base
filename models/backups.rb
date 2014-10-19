Model.new(:portraits_db, 'Portraits PostgreSQL') do
  database PostgreSQL do |db|
    db.name           = "db"
    db.username           = ENV['PORTRAITS_PG_USER']
    db.password           = ENV['PORTRAITS_PG_PASSWORD']
    db.host               = ENV['PG_PORT_5432_TCP_ADDR']
    db.port               = ENV['PG_PORT_5432_TCP_PORT']
  end

  compress_with Gzip
  notify_by Mail

  store_with S3 do |s3|
    s3.keep  = 24
    s3.path  = "/portraits/db/"
  end

  store_with Local do |local|
    local.path = '~/backups/portraits/db/'
    local.keep = 24
  end
end
