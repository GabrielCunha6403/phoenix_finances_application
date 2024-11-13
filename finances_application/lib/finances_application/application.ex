defmodule FinancesApplication.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FinancesApplicationWeb.Telemetry,
      FinancesApplication.Repo,
      {DNSCluster, query: Application.get_env(:finances_application, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FinancesApplication.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FinancesApplication.Finch},
      # Start a worker by calling: FinancesApplication.Worker.start_link(arg)
      # {FinancesApplication.Worker, arg},
      # Start to serve requests, typically the last entry
      FinancesApplicationWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FinancesApplication.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FinancesApplicationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
