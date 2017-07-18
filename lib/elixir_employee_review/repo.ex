defmodule ElixirEmployeeReview.Repo do
  use Ecto.Repo, otp_app: :elixir_employee_review
#  use Ecto.Repo, otp_app: :elixiremployeereview
  use Scrivener, page_size: 10  # <--- add this
end
