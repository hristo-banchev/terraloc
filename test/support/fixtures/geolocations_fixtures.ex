defmodule Terraloc.GeolocationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Terraloc.Geolocations` context.
  """

  @doc """
  Generate a geolocation.
  """
  def geolocation_fixture(attrs \\ %{}) do
    {:ok, geolocation} =
      attrs
      |> Enum.into(%{
        city: "Lovech",
        country: "Bulgaria",
        country_code: "BG",
        ip_address: "85.75.65.55",
        latitude: "43.127453235235253",
        longitude: "24.713223372835684",
        mystery_value: "42"
      })
      |> Terraloc.Geolocations.create_geolocation()

    geolocation
  end
end
