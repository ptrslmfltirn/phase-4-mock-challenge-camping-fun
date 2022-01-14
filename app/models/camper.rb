class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups
    validates :name, presence: true 
    validate :agecheck

    def agecheck 
        if self.age > 18
            errors.add(:age, "Too old!")
        end
        if self.age < 8
            errors.add(:age, "Too young!")
        end
    end
end
