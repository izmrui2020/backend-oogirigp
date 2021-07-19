unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider:              => 'AWS',
      :aws_access_key_id:     => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key: => ENV['AWS_SECRET_ACCESS_KEY'],
      :region:                => ENV['AWS_REGION']
      #:path_style             => true,
    }

    # S3のURLに直アクセス禁止
    # config.fog_public = false

    #config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
    config.fog_directory  = ENV['AWS_S3_BUCKET']
    config.cache_storage = :fog
  end
end