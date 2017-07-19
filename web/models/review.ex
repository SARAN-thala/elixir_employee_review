defmodule ElixirEmployeeReview.Review do
  use ElixirEmployeeReview.Web, :model

  schema "reviews" do
    field :review, :string
    field :rating, :string
    field :employee_id, :integer
    field :reviewer_id, :integer
#    belongs_to :employee, ElixirEmployeeReview.Employee
#    belongs_to :reviewer, ElixirEmployeeReview.Reviewer

    timestamps()
  end
  @required_fields [:review, :rating, :employee_id, :reviewer_id]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:review, min: 1, max: 500)
    |> validate_length(:rating, min: 1, max: 1)
    |> validate_format(:rating, ~r/[A-C]/)
  end
end
