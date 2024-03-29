defmodule YPEmailOffers.Repo.Migrations.AddGraduatesTable do
  use Ecto.Migration

  def change do
    create table("graduates") do
      add :external_id, :uuid, null: false
      add :email, :string, null: false
      add :salutation, :string
      add :firstname, :string, null: false
      add :lastname, :string, null: false
      add :date_of_birth, :date, null: false

      timestamps()
    end
  end
end
