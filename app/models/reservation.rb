class Reservation < ActiveRecord::Base
  
  STATES = %w( free reserved )
  
  validates :book_id, presence: true
  validates :state,   inclusion: { in: STATES }
  validates :user,    presence: true
  
  validates :book_id, uniqueness: { 
                        scope: :state, 
                        message: 'book has been already reserved' 
                   }, if: "state == 'reserved'"
                   
                   
  before_validation :make_reserved, :on => :create
  
  belongs_to :book
  belongs_to :user
  
  def free
    self.update_attributes({state: 'free'})
  end
  
  
  private
  
  def make_reserved
    self.state = 'reserved'
  end
  
end
