# encoding: utf-8
# Backup v4.x Configuration

Logger.configure do
  console.quiet     = false
end

Database::PostgreSQL.defaults do |db|
  db.additional_options = ["-Fc", "-E=utf8","--no-acl","--no-owner"]
end

Storage::S3.defaults do |s3|
  s3.access_key_id     = ENV["AWS_ACCESS_KEY_ID"]
  s3.secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]
  s3.bucket            = "robin-0830"
end

Notifier::Mail.defaults do |mail|
  mail.on_success           = true
  mail.on_warning           = true
  mail.on_failure           = true
  mail.from                 = 'nate+henri@natedelage.com'
  mail.to                   = 'nate@natedelage.com'
  mail.address              = 'smtp.mandrillapp.com'
  mail.port                 = 587
  mail.user_name            = 'nate@natedelage.com'
  mail.password             = 'PjF7StwXBKTLxDgowlicBA'
  mail.authentication       = 'plain'
end

