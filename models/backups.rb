Model.new(:portraits_db, 'Portraits PostgreSQL') do
  database PostgreSQL do |db|
    db.database           = "db"
    db.username           = ENV['PORTRAITS_PG_USER']
    db.password           = ENV['PORTRAITS_PG_PASSWORD']
    db.host               = ENV['PORTRAITS_PG_HOST']
    db.port               = ENV['PORTRAITS_PG_PORT']
  end

  compress_with Gzip
  notify_by Mail

  store_with S3 do |s3|
    s3.keep  = 24
    s3.path  = "/portraits/db/"
  end
end
