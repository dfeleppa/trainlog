class User < ApplicationRecord
    has_many :entries
    has_many :sections, through: :entries
   
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :first_name, :last_name, presence: true

    # def self.from_omniauth(auth)
    #       where(email: auth.info.email).first_or_initialize do |user|
    #         user.email = auth.info.email
    #         user.password = SecureRandom.hex
    #     end
    # end
end
