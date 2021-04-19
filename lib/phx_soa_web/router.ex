defmodule PhxSoaWeb.Router do
  use PhxSoaWeb, :router

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

  scope "/", PhxSoaWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", PhxSoaWeb do
    pipe_through :api

    resources "/books", BookController, except: [:new, :edit]
  end
  

  # Other scopes may use custom stacks.
  # scope "/api", PhxSoaWeb do
  #   pipe_through :api
  # end
end
