defmodule Terraloc.Geolocations do
  @moduledoc """
  The Geolocations context.
  """

  import Ecto.Query, warn: false
  alias Terraloc.Repo

  alias Terraloc.Geolocations.Geolocation

  @doc """
  Returns the list of geolocations.

  ## Examples

      iex> list_geolocations()
      [%Geolocation{}, ...]

  """
  def list_geolocations do
    Repo.all(Geolocation)
  end

  @doc """
  Gets a single geolocation.

  Raises `Ecto.NoResultsError` if the Geolocation does not exist.

  ## Examples

      iex> get_geolocation!(123)
      %Geolocation{}

      iex> get_geolocation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_geolocation!(id), do: Repo.get!(Geolocation, id)

  @doc """
  Gets a single geolocation by an IP address.

  Raises `Ecto.NoResultsError` if the Geolocation does not exist.

  ## Examples

      iex> get_geolocation_by_ip!("85.75.65.55")
      %Geolocation{}

      iex> get_geolocation_by_ip!("85.75.65.0")
      ** (Ecto.NoResultsError)

  """
  def get_geolocation_by_ip!(ip_address), do: Repo.get_by!(Geolocation, ip_address: ip_address)

  @doc """
  Creates a geolocation.

  ## Examples

      iex> create_geolocation(%{field: value})
      {:ok, %Geolocation{}}

      iex> create_geolocation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_geolocation(attrs \\ %{}) do
    %Geolocation{}
    |> Geolocation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a geolocation.

  ## Examples

      iex> update_geolocation(geolocation, %{field: new_value})
      {:ok, %Geolocation{}}

      iex> update_geolocation(geolocation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_geolocation(%Geolocation{} = geolocation, attrs) do
    geolocation
    |> Geolocation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a geolocation.

  ## Examples

      iex> delete_geolocation(geolocation)
      {:ok, %Geolocation{}}

      iex> delete_geolocation(geolocation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_geolocation(%Geolocation{} = geolocation) do
    Repo.delete(geolocation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking geolocation changes.

  ## Examples

      iex> change_geolocation(geolocation)
      %Ecto.Changeset{data: %Geolocation{}}

  """
  def change_geolocation(%Geolocation{} = geolocation, attrs \\ %{}) do
    Geolocation.changeset(geolocation, attrs)
  end
end
