defmodule Terraloc.Geolocations.Geolocation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "geolocations" do
    field :city, :string
    field :country, :string
    field :country_code, :string
    field :ip_address, :string
    field :latitude, :string
    field :longitude, :string
    field :mystery_value, :string

    timestamps()
  end

  @doc false
  def changeset(geolocation, attrs) do
    geolocation
    |> cast(attrs, [
      :ip_address,
      :country_code,
      :country,
      :city,
      :latitude,
      :longitude,
      :mystery_value
    ])
    |> validate_required([:ip_address, :country_code, :country, :city, :latitude, :longitude])
    |> validate_length(:ip_address, min: 7, max: 15)
    |> validate_length(:country_code, min: 2, max: 3)
    |> validate_length(:country, max: 100)
    |> validate_length(:city, max: 100)
    |> validate_length(:latitude, max: 19)
    |> validate_length(:longitude, max: 20)
    |> unique_constraint(:ip_address)
  end
end
