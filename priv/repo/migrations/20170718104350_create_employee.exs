defmodule ElixirEmployeeReview.Repo.Migrations.CreateEmployee do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string, null: false, size: 20
      add :email, :string, null: false, size: 30
      add :role, :string, null: false, size: 10
      add :employee_id, :integer, primary_key: true

      timestamps()
    end
    create unique_index(:employees, [:employee_id])
    create constraint(:employees, :employee_id_must_be_positive, check: "employee_id > 0")

  end
end
