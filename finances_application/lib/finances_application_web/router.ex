defmodule FinancesApplicationWeb.Router do
  use FinancesApplicationWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {FinancesApplicationWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug Plug.CSRFProtection, with: :clear_session # Disable for specific requests
  end

  scope "/", FinancesApplicationWeb do
    pipe_through :api

    get "/", PageController, :home

    # ROTAS ====================================
    get "/receitas", ReceitaController, :hello

    # ENDPOINTS ================================
    scope "/api" do
      get "/receitas", ReceitaController, :all
      get "/receitas/:id", ReceitaController, :get
      post "/receitas", ReceitaController, :create
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", FinancesApplicationWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:finances_application, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: FinancesApplicationWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
