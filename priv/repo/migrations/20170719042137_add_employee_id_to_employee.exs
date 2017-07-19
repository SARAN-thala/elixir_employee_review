defmodule ElixirEmployeeReview.Repo.Migrations.AddEmployeeIdToEmployee do
  use Ecto.Migration

  def change do
    alter table :employees do
      add :employee_id, :integer
    end
  end
end
