defmodule YPEmailOffers.GraduatesClient do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://randomuser.me"
  plug Tesla.Middleware.JSON

  def graduates(count \\ 100) do
    get("/api/?seed=jobmensa&results=#{count}")
  end
end
