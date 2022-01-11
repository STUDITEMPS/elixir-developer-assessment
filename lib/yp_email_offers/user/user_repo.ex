defmodule YPEmailOffers.UserRepo do
  import Ecto.Query, only: [from: 2]

  alias YPEmailOffers.Repo
  alias YPEmailOffers.User

  def create_user(%{} = user) do
    %User{}
    |> User.changeset(user)
    |> Repo.insert()
  end

  def find_user(user_id) do
    from(user in User, select: user, where: user.id == ^user_id) |> Repo.one()
  end
end
