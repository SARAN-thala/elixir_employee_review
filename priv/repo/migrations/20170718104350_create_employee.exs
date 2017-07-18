defmodule ElixirEmployeeReview.Repo.Migrations.CreateEmployee do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string
      add :email, :string
      add :role, :string
      add :manager_id, :integer

      timestamps()
    end

  end
end
