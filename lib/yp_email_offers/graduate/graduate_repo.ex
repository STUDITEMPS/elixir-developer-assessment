defmodule YPEmailOffers.GraduateRepo do
  import Ecto.Query, only: [from: 2]

  alias YPEmailOffers.Repo
  alias YPEmailOffers.Graduate

  def all(), do: Repo.all(Graduate)

  def create_graduate(%{} = graduate) do
    %Graduate{}
    |> Graduate.changeset(graduate)
    |> Repo.insert()
  end

  def find_graduate(graduate_id) do
    from(graduate in Graduate, select: graduate, where: graduate.id == ^graduate_id) |> Repo.one()
  end
end
