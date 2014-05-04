if defined? AssetSync
  AssetSync.configure do |config|
    # Store assets on the psychedeli.ca S3 bucket
    config.fog_provider = 'AWS'
    config.aws_access_key_id = Eye.config.aws.access_key_id
    config.aws_secret_access_key = Eye.config.aws.secret_access_key
    config.fog_directory = 'f.psychedeli.ca/eye/assets'

    # Invalidate a file on a cdn after uploading files
    config.cdn_distribution_id = Eye.config.aws.cdn_distro_id
    config.invalidate = ['application.js', 'application.css']

    # Automatically replace files with their equivalent gzip compressed version
    config.gzip_compression = true

    # Use the Rails generated 'manifest.yml' file to produce the list of files to
    # upload instead of searching the assets directory.
    config.manifest = true
  end
end
