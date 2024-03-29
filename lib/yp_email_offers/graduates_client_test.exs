defmodule YPEmailOffers.GraduatesClientTest do
  use YPEmailOffers.DataCase, async: false

  import Tesla.Mock

  alias YPEmailOffers.GraduatesClient

  describe "graduates/1" do
    test "" do
      response_body = File.read!("test/fixtures/graduates.json")

      mock(fn
        %{method: :get, url: "https://randomuser.me/api/" <> _} ->
          %Tesla.Env{status: 200, body: response_body}
      end)

      assert {:ok, %{body: ^response_body}} = GraduatesClient.graduates()
    end
  end
end
