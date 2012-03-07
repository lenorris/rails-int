class MakeReservationsBelongToUsers < ActiveRecord::Migration
 
  def change
    change_table :reservations do |t|
      t.references :user
      t.remove     :email
    end
  end
  
end
