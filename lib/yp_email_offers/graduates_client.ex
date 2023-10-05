defmodule YPEmailOffers.GraduatesClient do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://randomuser.me"
  plug Tesla.Middleware.JSON

  @spec graduates(pos_integer()) :: list(map)
  def graduates(count \\ 100) do
    case get("/api/?seed=jobmensa&results=#{count}") do
      {:ok, %Tesla.Env{status: 200, body: body}} ->
        Map.fetch!(body, "results")
    end
  end
end
