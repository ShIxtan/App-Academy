if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAJEOIMKKXE6CIP6MA'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['tutorialaaron']
  end
end
