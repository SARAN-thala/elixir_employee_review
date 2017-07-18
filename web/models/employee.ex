defmodule ElixirEmployeeReview.Employee do
  use ElixirEmployeeReview.Web, :model

  schema "employees" do
    field :name, :string
    field :email, :string
    field :role, :string
    field :manager_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :role, :manager_id])
    |> validate_required([:name, :email, :role, :manager_id])
  end
end
