# Uploader class for new images that have been uploaded through the
# front-end app.
class ImageUploader < CarrierWave::Uploader::Base
  # TODO: Use MiniMagick to process images
  #include CarrierWave::MiniMagick

  # Store uploads on S3, and distribute over CloudFront.
  storage :fog

  # Store all user uploads in the `uploads/` directory.
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  # Only allow images to be uploaded with this particular Uploader
  # object.
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
