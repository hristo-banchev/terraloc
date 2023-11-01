# Terraloc

A Phoenix application that provides a geolocation API.

## Setup

The application is built with Elixir 1.14.3 and Phoenix 1.7.7. The application
also requires access to a running PostgreSQL RDBMS.

To start your Phoenix server:

  * Open `config/dev.exs` and enter your database creadentials
  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with
    `iex -S mix phx.server`

## Use

Once the server is running you can use this endpoint via `curl` or your browser
to get geolocation data:

```
GET /api/v1/geolocations/:ip_address
```

For example, http://localhost:4000/api/v1/geolocations/200.106.141.15.

## Geolocation data ingestion

You can ingest geolocation CSV dumps. Terraloc relies on the library
[terraloc_ingest](https://github.com/hristo-banchev/terraloc_ingest) to handle
this. The CSV headers and data should comply with the `Terraloc.Geolocations.Geolocation`
schema. You can perform this by running this mix task:

```shell
$ mix terraloc.ingest vio_com_ingest /path/to/geolocation_data.csv
```