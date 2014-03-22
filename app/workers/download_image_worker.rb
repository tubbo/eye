
# Download an image from a given URL source, and uploads it with
# CarrierWave to our own S3/CloudFront CDN.

class DownloadImageWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(image)
    if image.mirror?
      @image = image
      download_from_remote_server and upload_to_cloud_storage
    else
      logger.error "Image is not a mirror."
    end
  end

  protected
  def download_from_remote_server
    @response = Net::HTTP.get @image.uri.to_s
    return true if @response.success?
    logger.error "Could not download Image at URL=#{@image.uri}"
    false
  end

  def upload_to_cloud_storage
    if image.file.store!(tmp_file)
      logger.debug "Uploaded file to S3"
      logger.debug "Removed tmp file" if FileUtils.rm_rf tmp_file_path
      true
    else
      logger.error "Couldn't upload file to S3"
      false
    end
  end

  private
  def tmp_file
    @tmp_file = File.new tmp_file_path, 'w+' do |file|
      file.puts @response.body
    end
  end

  def filename_from_uri
    @filename_from_uri ||= @image.uri.path.split('/').last
  end

  def tmp_file_path
    @tmp_file_path ||= "#{Rails.root}/tmp/downloads/#{filename_from_uri}"
  end
end
