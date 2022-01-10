defmodule YPEmailOffers.Repo do
  use Ecto.Repo,
    otp_app: :yp_email_offers,
    adapter: Ecto.Adapters.Postgres
end
