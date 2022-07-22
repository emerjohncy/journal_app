class Task < ApplicationRecord
    validates :name,    presence: true

    validates :description, presence: true

    validates :deadline, presence: true
    
    belongs_to :category
    
    delegate :user, to: :category
end
