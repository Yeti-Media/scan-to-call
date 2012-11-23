if Rails.env.test? # Use file storage and disable processing for speed
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else # Use Amazon S3
  CarrierWave.configure do |config|
    config.storage = :fog
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => 'AKIAJKTZC2AHYR6PIISA',       # required
      :aws_secret_access_key  => '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',       # required
      :region                 => 'us-east-1'
    }
    config.fog_directory  = "scantocall-#{Rails.env}"
    config.fog_public     = true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'} # ten years!
  end
end
