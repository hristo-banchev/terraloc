defmodule Terraloc.GeolocationsTest do
  use Terraloc.DataCase

  alias Terraloc.Geolocations

  describe "geolocations" do
    alias Terraloc.Geolocations.Geolocation

    import Terraloc.GeolocationsFixtures

    @valid_attrs %{
      city: "Berlin",
      country: "Germany",
      country_code: "DE",
      ip_address: "43.107.22.33",
      latitude: "52.516236934573475",
      longitude: "13.372765108475607",
      mystery_value: "17"
    }

    @invalid_attrs %{
      city: String.duplicate("a", 150),
      country: String.duplicate("b", 150),
      country_code: "DEDE",
      ip_address: "006.255.255.255",
      latitude: "some text",
      longitude: "1324.37276510847560700000000000"
    }

    @blank_attrs %{
      city: nil,
      country: nil,
      country_code: nil,
      ip_address: nil,
      latitude: nil,
      longitude: nil
    }

    test "list_geolocations/0 returns all geolocations" do
      geolocation = geolocation_fixture()
      assert Geolocations.list_geolocations() == [geolocation]
    end

    test "get_geolocation!/1 returns the geolocation with given id" do
      geolocation = geolocation_fixture()
      assert Geolocations.get_geolocation!(geolocation.id) == geolocation
    end

    test "get_geolocation_by_ip!/1 returns the geolocation with given IP address" do
      geolocation = geolocation_fixture()
      assert Geolocations.get_geolocation_by_ip!(geolocation.ip_address) == geolocation
    end

    test "create_geolocation/1 with valid data creates a geolocation" do
      assert {:ok, %Geolocation{} = geolocation} = Geolocations.create_geolocation(@valid_attrs)
      assert geolocation.city == "Berlin"
      assert geolocation.country == "Germany"
      assert geolocation.country_code == "DE"
      assert geolocation.ip_address == "43.107.22.33"
      assert geolocation.latitude == "52.516236934573475"
      assert geolocation.longitude == "13.372765108475607"
      assert geolocation.mystery_value == "17"
    end

    test "create_geolocation/1 with valid data and duplicate IP address returns error changeset" do
      geolocation = geolocation_fixture()

      attrs = %{@valid_attrs | ip_address: geolocation.ip_address}

      assert {:error, %Ecto.Changeset{errors: [ip_address: {"has already been taken", _}]}} =
               Geolocations.create_geolocation(attrs)
    end

    test "create_geolocation/1 with invalid data returns error changeset" do
      assert {:error,
              %Ecto.Changeset{
                errors: [
                  longitude: {"has invalid format", _},
                  latitude: {"has invalid format", _},
                  city: {"should be at most %{count} character(s)", _},
                  country: {"should be at most %{count} character(s)", _},
                  country_code: {"has invalid format", _},
                  ip_address: {"has invalid format", _}
                ]
              }} = Geolocations.create_geolocation(@invalid_attrs)
    end

    test "create_geolocation/1 with blank data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geolocations.create_geolocation(@blank_attrs)
    end

    test "update_geolocation/2 with valid data updates the geolocation" do
      geolocation = geolocation_fixture()

      assert {:ok, %Geolocation{} = geolocation} = Geolocations.update_geolocation(geolocation, @valid_attrs)
      assert geolocation.city == "Berlin"
      assert geolocation.country == "Germany"
      assert geolocation.country_code == "DE"
      assert geolocation.ip_address == "43.107.22.33"
      assert geolocation.latitude == "52.516236934573475"
      assert geolocation.longitude == "13.372765108475607"
      assert geolocation.mystery_value == "17"
    end

    test "update_geolocation/2 with invalid data returns error changeset" do
      geolocation = geolocation_fixture()

      assert {:error,
              %Ecto.Changeset{
                errors: [
                  longitude: {"has invalid format", _},
                  latitude: {"has invalid format", _},
                  city: {"should be at most %{count} character(s)", _},
                  country: {"should be at most %{count} character(s)", _},
                  country_code: {"has invalid format", _},
                  ip_address: {"has invalid format", _}
                ]
              }} = Geolocations.update_geolocation(geolocation, @invalid_attrs)

      assert geolocation == Geolocations.get_geolocation!(geolocation.id)
    end

    test "update_geolocation/2 with blank data returns error changeset" do
      geolocation = geolocation_fixture()
      assert {:error, %Ecto.Changeset{}} = Geolocations.update_geolocation(geolocation, @blank_attrs)
      assert geolocation == Geolocations.get_geolocation!(geolocation.id)
    end

    test "update_geolocation/2 with existing IP address returns error changeset" do
      geolocation_1 = geolocation_fixture()
      geolocation_2 = geolocation_fixture(@valid_attrs)

      attrs = %{ip_address: geolocation_1.ip_address}

      assert {:error, %Ecto.Changeset{}} = Geolocations.update_geolocation(geolocation_2, attrs)
      assert geolocation_2 == Geolocations.get_geolocation!(geolocation_2.id)
    end

    test "delete_geolocation/1 deletes the geolocation" do
      geolocation = geolocation_fixture()
      assert {:ok, %Geolocation{}} = Geolocations.delete_geolocation(geolocation)
      assert_raise Ecto.NoResultsError, fn -> Geolocations.get_geolocation!(geolocation.id) end
    end

    test "change_geolocation/1 returns a geolocation changeset" do
      geolocation = geolocation_fixture()
      assert %Ecto.Changeset{} = Geolocations.change_geolocation(geolocation)
    end
  end
end
