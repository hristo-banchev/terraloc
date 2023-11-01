defmodule TerralocWeb.GeolocationControllerTest do
  use TerralocWeb.ConnCase

  import Terraloc.GeolocationsFixtures

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "show geolocation" do
    test "renders geolocation when data is valid", %{conn: conn} do
      geolocation = geolocation_fixture()

      conn = get(conn, ~p"/api/v1/geolocations/#{geolocation.ip_address}")

      assert %{
               "city" => "Lovech",
               "country" => "Bulgaria",
               "country_code" => "BG",
               "ip_address" => "85.75.65.55",
               "latitude" => "43.127453235235253",
               "longitude" => "24.713223372835684",
               "mystery_value" => "42"
             } = json_response(conn, 200)["data"]
    end

    test "returns 404 when there is no geolocation with the given IP address", %{conn: conn} do
      missing_ip_address = "123.123.123.123"

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/v1/geolocations/#{missing_ip_address}")
      end
    end
  end
end
