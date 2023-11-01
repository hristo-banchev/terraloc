defmodule Terraloc.Repo.Migrations.CreateGeolocations do
  use Ecto.Migration

  def change do
    create table(:geolocations) do
      add :ip_address, :string, size: 15, null: false
      add :country_code, :string, size: 3, null: false
      add :country, :string, size: 100, null: false
      add :city, :string, size: 100, null: false
      add :latitude, :string, size: 19, null: false
      add :longitude, :string, size: 20, null: false
      add :mystery_value, :string

      timestamps()
    end

    create unique_index(:geolocations, [:ip_address])
  end
end
