module HasAttachedAvatar
  extend ActiveSupport::Concern

  included do
    has_attached_file :avatar,
                      styles: { medium: '300x300>',
                                thumb: '100x100>'},
                      :default_url => "/images/:style/missing.png",

                      storage: :s3,
                      s3_credentials: {
                          bucket: ENV['AWS_BUCKET'],
                          access_key_id: ENV['AWS_ACCESS_KEY'],
                          secret_access_key: ENV['AWS_SECRET_KEY'],
                          s3_region: ENV['AWS_REGION'],
                          url: :s3_domain_url,
                          s3_host_name: "s3-#{ENV['AWS_REGION']}.amazonaws.com"
                      }
    validates_attachment :avatar,
                         content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  end
end
