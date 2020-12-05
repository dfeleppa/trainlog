class Athlete < ApplicationRecord
    belongs_to :user
    has_many :posts
    has_many :workouts, through: :posts
end
