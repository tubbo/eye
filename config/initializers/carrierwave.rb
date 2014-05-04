# Use Amazon S3 and CloudFront to store uploaded images.
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY']
  }
  config.fog_directory  = 'f.psychedeli.ca/eye'
  config.fog_public     = true
end
