defmodule ElixirEmployeeReview.ReviewTest do
  use ElixirEmployeeReview.ModelCase

  alias ElixirEmployeeReview.Review

  @valid_attrs %{rating: "A", review: "Awesome",  employee_id: 42,  reviewer_id: 2}
  @invalid_attrs %{rating: "xxx", review: "Awesome",  employee_id: 42,  reviewer_id: 2}

  test "changeset with valid attributes" do
    changeset = Review.changeset(%Review{}, @valid_attrs)
    assert changeset.valid?
  end

  test "rating should contain only A | B | C " do
    attrs = %{@valid_attrs | rating: "AA"}
    assert {:rating, "has invalid format"} in errors_on(%Review{}, attrs)
  end

  test "review should not be empty" do
    attrs = %{@valid_attrs | review: ""}
    assert {:review, "can't be blank"} in errors_on(%Review{}, attrs)
  end

  test "changeset with invalid attributes" do
    changeset = Review.changeset(%Review{}, @invalid_attrs)
    refute changeset.valid?
  end
end
