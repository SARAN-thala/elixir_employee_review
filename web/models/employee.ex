defmodule ElixirEmployeeReview.Employee do
  use ElixirEmployeeReview.Web, :model

  schema "employees" do
    field :name, :string
    field :email, :string
    field :role, :string
    field :employee_id, :integer
#    [saran] change employee

    timestamps()
  end

  @required_fields [:name, :email, :role, :employee_id]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:name, min: 1, max: 20)
    |> validate_length(:email, min: 3, max: 30)
    |> validate_length(:role, min: 1, max: 10)
    |> validate_number(:employee_id, greater_than: 0)
    |> validate_format(:email, ~r/@/)
  end
end
