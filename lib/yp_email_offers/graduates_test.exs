defmodule YPEmailOffers.GraduatesTest do
  alias YPEmailOffers.GraduateRepo
  use YPEmailOffers.DataCase, async: true
  import Tesla.Mock

  alias YPEmailOffers.Graduates

  describe "sync_graduates/0" do
    @tag :skip
    test "all is well" do
      assert {:ok, %{new: _new_graduates, existing: _existing_graduates}} = Graduates.sync_graduates()
    end

    test "new users should be persisted to database" do
      create_mock()
      assert {:ok, %{new: graduates, existing: []}} = Graduates.sync_graduates()

      assert [] != graduates

      assert GraduateRepo.all() |> Enum.sort() == graduates |> Enum.sort()
    end

    @tag :skip
    test "sync is idempotent" do
      create_mock()
      assert {:ok, %{new: graduates, existing: []}} = Graduates.sync_graduates()

      assert {:ok, %{new: [], existing: ^graduates}} = Graduates.sync_graduates()
    end

    defp create_mock() do
      response_body = Jason.decode!(File.read!("test/fixtures/graduates.json"))

      mock(fn
        %{method: :get, url: "https://randomuser.me/api/" <> _} ->
          %Tesla.Env{status: 200, body: response_body}
      end)
    end
  end

  describe "to_graduate" do
    test "maps json to graduate" do
      graduate_json =
        Jason.decode!(File.read!("test/fixtures/graduates.json"))["results"] |> List.first()

      graduate = %{
        email: "enio.barros@example.com",
        external_id: "51a7565e-9905-4c58-97bc-5586f414e1bd",
        firstname: "Enio",
        lastname: "Barros",
        salutation: "Mr",
        date_of_birth: ~D[1963-03-31]
      }

      assert ^graduate = Graduates.to_graduate(graduate_json)
    end
  end
end
