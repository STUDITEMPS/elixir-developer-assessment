defmodule YPEmailOffersWeb.PageController do
  use YPEmailOffersWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
