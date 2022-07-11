class Task < ApplicationRecord
    validates :name,    presence: true,
                        uniqueness: true

    validates :description, presence: true

    validates :deadline, presence: true
    
    belongs_to :category
end
