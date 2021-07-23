require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = ENV['AWS_S3_BUCKET']
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region:                ENV['AWS_REGION'],
    path_style:            true
  }

  # S3のURLに直アクセス禁止
  # config.fog_public = false
  #config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

end
