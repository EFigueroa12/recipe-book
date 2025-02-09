class Recipe < ApplicationRecord
    validates :name, presence: true
    belongs_to :user
    validates :user, presence: true

end
