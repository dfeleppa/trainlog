class User < ApplicationRecord
    belongs_to :coach
    # has_many :workouts
    # has_many :movements, through: :workouts
    has_secure_password
    validates :email, presence: true, uniqueness: true

    def self.from_omniauth(auth)
          where(email: auth.info.email).first_or_initialize do |user|
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end
end
