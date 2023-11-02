defmodule Terraloc.Geolocations.Geolocation do
  use Ecto.Schema
  import Ecto.Changeset

  # Source: https://stackoverflow.com/a/36760050
  @ip_address_regex ~r/^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.){3}(25[0-5]|(2[0-4]|1\d|[1-9]|)\d)$/

  # Both based on: https://stackoverflow.com/a/31408260. Adjusted the decimal digits to max 15.
  @latitude_regex ~r/^(\+|-)?(?:90(?:(?:\.0{1,6})?)|(?:[0-9]|[1-8][0-9])(?:(?:\.[0-9]{1,15})?))$/
  @longitude_regex ~r/^(\+|-)?(?:180(?:(?:\.0{1,6})?)|(?:[0-9]|[1-9][0-9]|1[0-7][0-9])(?:(?:\.[0-9]{1,15})?))$/

  @country_code_regex ~r/^[A-Z]{2,3}$/

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
    |> validate_format(:ip_address, @ip_address_regex)
    |> validate_format(:country_code, @country_code_regex)
    |> validate_length(:country, max: 100)
    |> validate_length(:city, max: 100)
    |> validate_format(:latitude, @latitude_regex)
    |> validate_format(:longitude, @longitude_regex)
    |> unique_constraint(:ip_address)
  end
end
