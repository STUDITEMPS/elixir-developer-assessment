defmodule YPEmailOffers.Graduate do
  use Ecto.Schema
  import Ecto.Changeset
  @type t :: %__MODULE__{}

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "graduates" do
    field :external_id, :binary_id
    field :email, :string
    field :salutation, :string
    field :firstname, :string
    field :lastname, :string
    field :date_of_birth, :date

    timestamps()
  end

  def changeset(graduates, attrs) do
    graduates
    |> cast(attrs, [:external_id, :email, :salutation, :firstname, :lastname, :date_of_birth])
    |> validate_required([:external_id, :email, :firstname, :lastname, :date_of_birth])
  end

  def age(%__MODULE__{date_of_birth: date_of_birth}, today \\ Date.utc_today()) do
    Date.diff(today, date_of_birth) |> Integer.floor_div(365)
  end
end
