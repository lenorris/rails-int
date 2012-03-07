class ReservationsController < ApplicationController
  
  def create
    @book = Book.find(params[:book_id])
    @reservation = @book.reservations.new(user: current_user)
    if @reservation.save
      flash[:notice] = "Book reserved"
      respond_to do |format|
        format.html { redirect_to book_path(@book) }
        format.js
      end
    else
      render :new
    end
  end
  
  def free
    @book = Book.find(params[:book_id])
    @reservation = @book.reservations.find(params[:id])
   
    if @reservation.free
      flash[:notice] = "Book is no longer reserved"
    else
      flash[:error]  = "Something went wrong"
    end
    redirect_to book_path(@book)
  end
  
end
