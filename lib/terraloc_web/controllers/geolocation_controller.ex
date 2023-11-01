defmodule TerralocWeb.GeolocationController do
  use TerralocWeb, :controller

  alias Terraloc.Geolocations

  action_fallback TerralocWeb.FallbackController

  def show(conn, %{"ip_address" => ip_address}) do
    geolocation = Geolocations.get_geolocation_by_ip!(ip_address)
    render(conn, :show, geolocation: geolocation)
  end
end
