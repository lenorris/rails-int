require 'test_helper'

class BookTest < ActiveSupport::TestCase
  
  context 'book instance' do
    
    setup do
      @book = Factory(:book)
    end

    should "have valid book" do
      assert @book.valid?
    end
    
    should have_many(:reservations)

    should validate_presence_of   :title
    should validate_uniqueness_of :title
    should validate_presence_of   :authors
    
    should validate_presence_of(:isbn).with_message(/is not a valid ISBN/)
    should_not allow_value("dfjlaksfjds").for(:isbn)
  end
  
end
