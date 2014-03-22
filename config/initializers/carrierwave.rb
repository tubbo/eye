
# Use Amazon S3 and CloudFront to store image assets.

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => Figaro.env.aws_access_key_id,
    :aws_secret_access_key  => Figaro.env.aws_secret_access_key
  }
  config.fog_directory  = 'f.psychedeli.ca'
  config.fog_public     = true
end
