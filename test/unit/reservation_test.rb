require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

  setup do
    @new_reservation = Factory.build(:reservation)
  end
  
  should validate_presence_of(:book_id)
  should validate_presence_of(:user)
  should allow_value("free").for(:state)
  should allow_value("reserved").for(:state)
  
  should "not allow reservation if the book already reserved" do
    reservation = Factory(:reservation, state: 'reserved')
    copy = Reservation.new(reservation.attributes)
    assert !copy.save
    assert_match /book has been already reserved/, copy.errors[:book_id].join
  end
  
  context 'reservation record' do
    setup do
      @new_reservation.save
    end
    
    subject { @new_reservation }
    
    should_not allow_value("invalid").for(:state)
  
    should "be initially reserved" do
      assert_equal 'reserved', @new_reservation.state
    end
  end

end
