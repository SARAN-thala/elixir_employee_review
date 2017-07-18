defmodule ElixirEmployeeReview.Repo.Migrations.CreateReview do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :review, :string
      add :rating, :string
      add :employee_id, references(:employees, on_delete: :nothing)
      add :reviewer_id, references(:employees, on_delete: :nothing)

      timestamps()
    end
    create index(:reviews, [:employee_id])
    create index(:reviews, [:reviewer_id])

  end
end
