defmodule ElixirEmployeeReview.ReviewTest do
  use ElixirEmployeeReview.ModelCase

  alias ElixirEmployeeReview.Review

  @valid_attrs %{rating: "some content", review: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Review.changeset(%Review{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Review.changeset(%Review{}, @invalid_attrs)
    refute changeset.valid?
  end
end
