defmodule MedusaServer.Router do
  use Plug.Router

  plug Plug.Parsers, parsers: [:urlencoded, :multipart]
  plug :match
  plug :dispatch

  get "/", do: send_resp(conn, 200, "Welcome")

  post "/process" do
    urls = conn.body_params["urls"]
    send_resp(conn, 201, "Processed")
  end

  match _, do: send_resp(conn, 404, "Oops!")
end
