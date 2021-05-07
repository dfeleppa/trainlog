class Section < ApplicationRecord
    belongs_to :entry

    validates :data, presence: true
    
  
    
    
      

end