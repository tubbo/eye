if defined? AssetSync
  AssetSync.configure do |config|
    # Store assets on Amazon S3
    config.fog_provider = 'AWS'
    config.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
    config.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    # config.aws_reduced_redundancy = true # To use AWS reduced redundancy storage.
    config.fog_directory = 'f.psychedeli.ca/eye'

    # Invalidate a file on a cdn after uploading files
    # config.cdn_distribution_id = "12345"
    config.invalidate = ['application.js', 'application.css']

    # Automatically replace files with their equivalent gzip compressed version
    config.gzip_compression = true

    # Use the Rails generated 'manifest.yml' file to produce the list of files to
    # upload instead of searching the assets directory.
    config.manifest = true
  end
end
