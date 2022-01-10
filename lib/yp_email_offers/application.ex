defmodule YPEmailOffers.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      YPEmailOffers.Repo,
      # Start the Telemetry supervisor
      YPEmailOffersWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: YPEmailOffers.PubSub},
      # Start the Endpoint (http/https)
      YPEmailOffersWeb.Endpoint
      # Start a worker by calling: YPEmailOffers.Worker.start_link(arg)
      # {YPEmailOffers.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: YPEmailOffers.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    YPEmailOffersWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
