defmodule ElixirEmployeeReview.EmployeeTest do
  use ElixirEmployeeReview.ModelCase

  alias ElixirEmployeeReview.Employee

  @valid_attrs %{email: "some content", manager_id: 42, name: "some content", role: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Employee.changeset(%Employee{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Employee.changeset(%Employee{}, @invalid_attrs)
    refute changeset.valid?
  end
end
