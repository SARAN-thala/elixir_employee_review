defmodule ElixirEmployeeReview.Router do
  use ElixirEmployeeReview.Web, :router
  use ExAdmin.Router

  # your app's routes
  scope "/admin", ExAdmin do
    pipe_through :browser
    admin_routes
  end


  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirEmployeeReview do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/employees", EmployeeController
    resources "/reviews", ReviewController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirEmployeeReview do
  #   pipe_through :api
  # end
end
