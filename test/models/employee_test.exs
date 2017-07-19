defmodule ElixirEmployeeReview.EmployeeTest do
  use ElixirEmployeeReview.ModelCase

  alias ElixirEmployeeReview.Employee

  @valid_attrs %{email: "some@email", employee_id: 42, name: "Some Name", role: "Some Role"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Employee.changeset(%Employee{}, @valid_attrs)
    assert changeset.valid?
  end

  test "name must not be empty" do
    attrs = %{@valid_attrs | name: ""}
    assert {:name, "can't be blank"} in errors_on(%Employee{}, attrs)
  end

  test "name should not exceed of 20 chars" do
    attrs = %{@valid_attrs | name: "SomeNameContainsMaxChars"}
    assert {:name, "should be at most 20 character(s)"} in errors_on(%Employee{}, attrs)
  end

  test "email should have atleast 3 chars" do
    attrs = %{@valid_attrs | email: "a@"}
    assert {:email, "should be at least 3 character(s)"} in errors_on(%Employee{}, attrs)
  end

  test "email should not exceed of 30 chars" do
    attrs = %{@valid_attrs | email: "SomeEmailContainsMoreThanThirtyChars"}
    assert {:email, "should be at most 30 character(s)"} in errors_on(%Employee{}, attrs)
  end

  test "email must contain @ symbol" do
    attrs = %{@valid_attrs | email: "fooeaxample.com"}
    assert {:email, "has invalid format"} in errors_on(%Employee{}, attrs)
  end

  test "employee ID should be greater than zero" do
    attrs = %{@valid_attrs | employee_id: -2}
    assert {:employee_id, "must be greater than 0"} in errors_on(%Employee{}, attrs)
  end

  test "role must not be empty" do
    attrs = %{@valid_attrs | role: ""}
    assert {:role, "can't be blank"} in errors_on(%Employee{}, attrs)
  end

  test "role should not exceed of 10 chars" do
    attrs = %{@valid_attrs | role: "SomeRoleContainsMaxChars"}
    assert {:role, "should be at most 10 character(s)"} in errors_on(%Employee{}, attrs)
  end

  test "changeset with invalid attributes" do
    changeset = Employee.changeset(%Employee{}, @invalid_attrs)
    refute changeset.valid?
  end
end
