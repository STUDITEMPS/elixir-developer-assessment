defmodule YPEmailOffers.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :external_id, :binary_id
    field :email, :string
    field :salutation, :string
    field :firstname, :string
    field :lastname, :string
    field :date_of_birth, :date

    timestamps()
  end

  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:external_id, :email, :salutation, :firstname, :lastname, :date_of_birth])
    |> validate_required([:external_id, :email, :firstname, :lastname, :date_of_birth])
  end
end
