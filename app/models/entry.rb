class Entry < ApplicationRecord
    belongs_to :user
    has_many :sections

    validates :name, presence: true
    validates :status, inclusion: { in: %w(complete incomplete) }
    # validates :name, uniqueness
    
    # def status
    #     if self.complete == true
    #         @status = "complete"
    #     else
    #         @status = "incomplete"
    #     end
    # end

end