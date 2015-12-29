class Task < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :title
    validates_presence_of :user
    validate :future_completed_date
    
    private
    
    def future_completed_date
        if !completed.blank? && completed > Date.today
            self.errors.add(:completed, "can't be in future!")
        end
    end
    
end
