defmodule Mylibrary.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Mylibrary.Repo,
      # Start the Telemetry supervisor
      MylibraryWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mylibrary.PubSub},
      # Start the Endpoint (http/https)
      MylibraryWeb.Endpoint
      # Start a worker by calling: Mylibrary.Worker.start_link(arg)
      # {Mylibrary.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mylibrary.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MylibraryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
