defmodule ElixirEmployeeReview.Repo.Migrations.CreateReview do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :review, :string, null: false, size: 500
      add :rating, :string, null: false, size: 1
      add :employee_id, references(:employees, column: "employee_id", on_delete: :delete_all, on_update: :update_all)
      add :reviewer_id, references(:employees, column: "employee_id", on_delete: :delete_all, on_update: :update_all)

      timestamps()
    end
    create index(:reviews, [:employee_id])
    create index(:reviews, [:reviewer_id])

  end
end
