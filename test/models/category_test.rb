require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_creating
    # category create
    @category = Category.new

    assert @category.save
  end

end
