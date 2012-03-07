require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  
  setup do
    @user          = Factory(:user)
    @book          = Factory(:book)
    @reserved_book = Factory(:book)
    @reservation   = Factory(:reservation, book: @reserved_book, state: 'reserved', user: @user)
    login_as(@user)
  end
  
  test "create reservation with valid parameters" do
    assert_difference("Reservation.count", +1) do
      post :create, book_id: @book.id
      assert_response :redirect
      assert_redirected_to book_path(@book)
      assert flash[:notice]
    end
  end
  
  test "free reservation" do
    put :free, book_id: @reserved_book.id, id: @reservation.id
    assert_response :redirect
    assert_redirected_to book_path(@reserved_book)
    assert_equal 'free', assigns(:reservation).state
    assert flash[:notice]
  end
  
  test "free someone else's reservation" do
    login_as Factory(:user)
    put :free, book_id: @reserved_book.id, id: @reservation.id
    
    assert_response :redirect
    assert_redirected_to book_path(@reserved_book)
    
    assert @reserved_book.reservation
  end
  

end
