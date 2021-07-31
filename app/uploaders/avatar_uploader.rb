class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  storage :fog

  #JPGで保存
  process :convert => 'jpg'

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    if model.present?
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    else
      'uploads/content_image/'
    end
  end

  # 許可する画像の拡張子
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  #日付で保存
  def filename
    if original_filename.present?
      time = Time.now
      name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
      name.downcase
    end
  end

  #サムネイルを生成
  version :thumb do
    process :resize_to_limit => [300, 300]
  end

end
