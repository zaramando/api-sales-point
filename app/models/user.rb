class User < ApplicationRecord
    has_many :products
    has_many :sales 
    has_secure_password
    validates :email, presence: true,
                  uniqueness: { case_sensitive: false },
                  format: /@/
end
