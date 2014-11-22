class Share < ActiveRecord::Base
  validates :token,
            presence: true,
            uniqueness: true

  validates :filename,
            presence: true,
            uniqueness: true,
            format: { with: /\A(?!\.).*\.zip\z/i }
end
