class User < ApplicationRecord
  validates :wallet_address, presence: true, uniqueness: { case_sensitive: false }
end
