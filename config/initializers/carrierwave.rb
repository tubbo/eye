# Use Amazon S3 and CloudFront to store uploaded images.
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => Eye.config.aws.access_key_id,
    :aws_secret_access_key  => Eye.config.aws.secret_access_key
  }
  config.fog_directory  = 'f.psychedeli.ca/eye'
  config.fog_public     = true
end
