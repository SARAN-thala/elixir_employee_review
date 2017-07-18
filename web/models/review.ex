defmodule ElixirEmployeeReview.Review do
  use ElixirEmployeeReview.Web, :model

  schema "reviews" do
    field :review, :string
    field :rating, :string
    belongs_to :employee, ElixirEmployeeReview.Employee
    belongs_to :reviewer, ElixirEmployeeReview.Reviewer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:review, :rating])
    |> validate_required([:review, :rating])
  end
end
