class Signup < ApplicationRecord
    belongs_to :camper
    belongs_to :activity 
    # validate :timecheck 
    validates :time, numericality:  {greater_than_or_equal_to: 0}
    validates :time, numericality:  {less_than_or_equal_to: 23}


    # def timecheck 
    #     if self.time > 23 
    #         errors.add(:time, 'Invalid time')
    #     end 
    #     if self.time < 0
    #         errors.add(:time, 'Invalid time')
    #     end
    # end
end
