defmodule YPEmailOffers.Graduates do
  alias YPEmailOffers.GraduateRepo
  alias YPEmailOffers.GraduatesClient

  @type result :: %{
          new: list(YPEmailOffers.Graduate.t()),
          existing: list(YPEmailOffers.Graduate.t())
        }

  @spec sync_graduates() :: {:ok, result()} | {:error, any()}
  def sync_graduates() do
    results =
      GraduatesClient.graduates()
      |> Enum.map(&to_graduate/1)
      |> Enum.map(&GraduateRepo.create_graduate/1)

    {:ok, %{new: Keyword.get_values(results, :ok), existing: Keyword.get_values(results, :error)}}
  end

  def to_graduate(graduate_json) do
    %{
      "email" => email,
      "login" => %{"uuid" => uuid},
      "name" => %{"title" => salutation, "first" => firstname, "last" => lastname},
      "dob" => %{"date" => date_of_birth}
    } =
      graduate_json

    %{
      email: email,
      external_id: uuid,
      firstname: firstname,
      lastname: lastname,
      salutation: salutation,
      date_of_birth: extract_date_from_date_time_string(date_of_birth)
    }
  end

  defp extract_date_from_date_time_string(date_time_string) do
    case DateTime.from_iso8601(date_time_string) do
      {:ok, date_time, _} ->
        DateTime.to_date(date_time)
    end
  end
end
