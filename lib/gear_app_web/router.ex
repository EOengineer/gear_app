defmodule GearAppWeb.Router do
  use GearAppWeb, :router

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

  scope "/", GearAppWeb do
    pipe_through :api 
    resources "/gears", GearController, except: [:new, :edit]
  end

  scope "/", GearAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/sign-in", SessionController, :new
    post "/sign-in", SessionController, :create
    delete "/sign-out", SessionController, :delete

    resources "/users", UserController
  end

  

  # Other scopes may use custom stacks.
  # scope "/api", GearAppWeb do
  #   pipe_through :api
  # end
end
